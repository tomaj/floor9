#!/bin/zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOKEN_FILE="$SCRIPT_DIR/.decklink-token"
DECKS_FILE="$SCRIPT_DIR/.decklink-decks.json"
ASSETS_FILE="$SCRIPT_DIR/.decklink-assets.json"
BASE_URL="https://emp.st.sk/decklink"

if [ ! -f "$TOKEN_FILE" ]; then
  echo "Error: $TOKEN_FILE not found"
  exit 1
fi

TOKEN=$(tr -d '[:space:]' < "$TOKEN_FILE")

if [ $# -lt 1 ]; then
  echo "Usage: $0 <path-to-newsletter.html> [deck-name]"
  echo "Example: $0 vydania/2026-06-26-05-level-up-day/newsletter.html \"FLOOR 9 N°05\""
  exit 1
fi

HTML_FILE="$1"
DECK_NAME="${2:-}"

if [ ! -f "$HTML_FILE" ]; then
  echo "Error: $HTML_FILE not found"
  exit 1
fi

HTML_DIR="$(cd "$(dirname "$HTML_FILE")" && pwd)"
EDITION_KEY=$(basename "$HTML_DIR")

[ -f "$DECKS_FILE" ] || echo '{}' > "$DECKS_FILE"
[ -f "$ASSETS_FILE" ] || echo '{}' > "$ASSETS_FILE"

# --- Upload images as assets ---

ASSET_MAP_FILE=$(mktemp /tmp/decklink-assetmap.XXXXXX)
: > "$ASSET_MAP_FILE"

upload_asset() {
  local filepath="$1"
  local filename="$(basename "$filepath")"
  local asset_key="$EDITION_KEY/$filename"
  local file_hash
  file_hash=$(shasum -a 256 "$filepath" | cut -d' ' -f1)

  local existing_hash
  existing_hash=$(jq -r --arg k "$asset_key" '.[$k].hash // empty' "$ASSETS_FILE")

  if [ "$existing_hash" = "$file_hash" ]; then
    local cached_id
    cached_id=$(jq -r --arg k "$asset_key" '.[$k].assetId' "$ASSETS_FILE")
    echo "$filename	$cached_id" >> "$ASSET_MAP_FILE"
    echo "  $filename -> $cached_id (cached)"
    return
  fi

  local resp
  resp=$(curl -s -w "\n%{http_code}" \
    -X POST "$BASE_URL/api/assets/upload" \
    -H "Authorization: Bearer $TOKEN" \
    -F "file=@$filepath")

  local code body asset_id
  code=$(echo "$resp" | tail -1)
  body=$(echo "$resp" | sed '$d')

  if [ "$code" -ge 200 ] && [ "$code" -lt 300 ]; then
    asset_id=$(echo "$body" | jq -r '.id')
    jq --arg k "$asset_key" --arg id "$asset_id" --arg h "$file_hash" \
      '. + {($k): {assetId: $id, hash: $h}}' "$ASSETS_FILE" > "$ASSETS_FILE.tmp"
    mv "$ASSETS_FILE.tmp" "$ASSETS_FILE"
    echo "$filename	$asset_id" >> "$ASSET_MAP_FILE"
    echo "  $filename -> $asset_id (uploaded)"
  else
    echo "  Warning: failed to upload $filename ($code)" >&2
  fi
}

echo "=== Uploading images ==="

IMAGE_FILES=$(grep -oE 'src="[^"]+\.(jpg|jpeg|png|gif|webp|svg)"' "$HTML_FILE" \
  | sed 's/src="//;s/"$//' \
  | grep -v '^http\|^data:' \
  | sort -u || true)

if [ -z "$IMAGE_FILES" ]; then
  echo "  No local images found"
else
  echo "$IMAGE_FILES" | while read -r img; do
    img_path="$HTML_DIR/$img"
    if [ ! -f "$img_path" ]; then
      echo "  Warning: $img not found, skipping"
      continue
    fi
    upload_asset "$img_path"
  done
fi

# --- Create or get deck (need shortId for asset URLs) ---

DECK_INFO=$(jq -r --arg key "$EDITION_KEY" '.[$key] // empty' "$DECKS_FILE")
DECK_ID=""
SHORT_ID=""
SHARE_URL=""

if [ -n "$DECK_INFO" ]; then
  DECK_ID=$(echo "$DECK_INFO" | jq -r '.deckId // empty' 2>/dev/null || echo "")
  SHORT_ID=$(echo "$DECK_INFO" | jq -r '.shortId // empty' 2>/dev/null || echo "")
  SHARE_URL=$(echo "$DECK_INFO" | jq -r '.shareUrl // empty' 2>/dev/null || echo "")
fi

IS_NEW=false

if [ -z "$DECK_ID" ]; then
  [ -z "$DECK_NAME" ] && DECK_NAME="FLOOR 9 - $EDITION_KEY"

  echo ""
  echo "=== Creating new deck ==="
  RESPONSE=$(curl -s -w "\n%{http_code}" \
    -X POST "$BASE_URL/api/decks" \
    -H "Authorization: Bearer $TOKEN" \
    -F "file=@$HTML_FILE" \
    -F "name=$DECK_NAME")

  HTTP_CODE=$(echo "$RESPONSE" | tail -1)
  BODY=$(echo "$RESPONSE" | sed '$d')

  if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 300 ]; then
    echo "Error creating deck ($HTTP_CODE):"
    echo "$BODY" | jq . 2>/dev/null || echo "$BODY"
    rm -f "$ASSET_MAP_FILE"
    exit 1
  fi

  DECK_ID=$(echo "$BODY" | jq -r '.id')
  SHORT_ID=$(echo "$BODY" | jq -r '.shortId')
  SHARE_URL=$(echo "$BODY" | jq -r '.shareUrl')

  jq --arg key "$EDITION_KEY" --arg did "$DECK_ID" --arg sid "$SHORT_ID" --arg url "$SHARE_URL" \
    '. + {($key): {deckId: $did, shortId: $sid, shareUrl: $url}}' "$DECKS_FILE" > "$DECKS_FILE.tmp"
  mv "$DECKS_FILE.tmp" "$DECKS_FILE"

  echo "Created deck: $DECK_ID (short: $SHORT_ID)"
  echo "Share URL: $SHARE_URL"
  IS_NEW=true
fi

# --- Build modified HTML with asset URLs and upload ---

ASSET_COUNT=$(wc -l < "$ASSET_MAP_FILE" | tr -d ' ')

if [ "$ASSET_COUNT" -gt 0 ] && [ -n "$SHORT_ID" ]; then
  echo ""
  echo "=== Replacing image URLs ==="

  TMPFILE=$(mktemp /tmp/decklink-upload.XXXXXX.html)
  cp "$HTML_FILE" "$TMPFILE"

  while IFS=$'\t' read -r img_name asset_id; do
    new_url="/decklink/api/decks/s/$SHORT_ID/assets/$asset_id?v=original"
    sed -i '' "s|src=\"$img_name\"|src=\"$new_url\"|g" "$TMPFILE"
    echo "  $img_name -> .../$asset_id"
  done < "$ASSET_MAP_FILE"

  echo ""
  echo "=== Uploading version with asset URLs ==="
  RESPONSE=$(curl -s -w "\n%{http_code}" \
    -X POST "$BASE_URL/api/decks/$DECK_ID/versions" \
    -H "Authorization: Bearer $TOKEN" \
    -F "file=@$TMPFILE;filename=newsletter.html")

  rm -f "$TMPFILE"

  HTTP_CODE=$(echo "$RESPONSE" | tail -1)
  BODY=$(echo "$RESPONSE" | sed '$d')

  if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
    VERSION=$(echo "$BODY" | jq -r '.version')
    echo "Uploaded version $VERSION"
  else
    echo "Error uploading version ($HTTP_CODE):"
    echo "$BODY" | jq . 2>/dev/null || echo "$BODY"
    rm -f "$ASSET_MAP_FILE"
    exit 1
  fi
elif [ "$IS_NEW" = false ]; then
  echo ""
  echo "=== Uploading new version ==="
  RESPONSE=$(curl -s -w "\n%{http_code}" \
    -X POST "$BASE_URL/api/decks/$DECK_ID/versions" \
    -H "Authorization: Bearer $TOKEN" \
    -F "file=@$HTML_FILE")

  HTTP_CODE=$(echo "$RESPONSE" | tail -1)
  BODY=$(echo "$RESPONSE" | sed '$d')

  if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
    VERSION=$(echo "$BODY" | jq -r '.version')
    echo "Uploaded version $VERSION"
  else
    echo "Error ($HTTP_CODE):"
    echo "$BODY" | jq . 2>/dev/null || echo "$BODY"
    rm -f "$ASSET_MAP_FILE"
    exit 1
  fi
fi

rm -f "$ASSET_MAP_FILE"

echo ""
echo "=== Done ==="
[ -n "$SHARE_URL" ] && echo "Share URL: $SHARE_URL"
