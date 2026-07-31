#!/bin/zsh
# Open an HTML newsletter as a ready-to-send Outlook for Mac draft.
#
# Usage: open-draft.sh <path-to-newsletter.html> "<email subject>"
#
# The call order below is load-bearing - see SKILL.md. Setting the body before
# opening the window is the only sequence Outlook for Mac accepts.
set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <path-to-newsletter.html> \"<email subject>\""
  echo "Example: $0 vydania/2026-09-04-11-engagement-psychology/newsletter.html \"FLOOR 9 · Issue N°11 - Great apps aren't luck. They're patterns.\""
  exit 1
fi

HTML_FILE="$1"
SUBJECT="$2"

if [ ! -f "$HTML_FILE" ]; then
  echo "Error: $HTML_FILE not found"
  exit 1
fi

# --- 1. Close stale compose windows for this subject -------------------------
# Repeated runs otherwise leave several identically titled windows behind and
# you can no longer tell which one holds the rendered body.
MARKER=$(printf '%s' "$SUBJECT" | cut -c1-40)
osascript - "$MARKER" <<'APPLE' >/dev/null 2>&1 || true
on run argv
	set marker to item 1 of argv
	tell application "Microsoft Outlook"
		repeat 12 times
			set didClose to false
			repeat with w in windows
				try
					if (name of w) contains marker then
						close w saving no
						set didClose to true
						exit repeat
					end if
				end try
			end repeat
			if not didClose then exit repeat
		end repeat
	end tell
end run
APPLE

# --- 2. Build the AppleScript with the HTML inlined -------------------------
SCPT=$(mktemp /tmp/outlook-draft.XXXXXX.scpt)
trap 'rm -f "$SCPT"' EXIT

HTML_FILE="$HTML_FILE" SUBJECT="$SUBJECT" python3 - > "$SCPT" <<'PY'
import os
html = open(os.environ['HTML_FILE'], encoding='utf-8').read()
subject = os.environ['SUBJECT']
def esc(s):
    return s.replace('\\', '\\\\').replace('"', '\\"')
print('''tell application "Microsoft Outlook"
	activate
	set msg to make new outgoing message
	delay 0.6
	set subject of msg to "%s"
	set content of msg to "%s"
	delay 1.2
	set h to (has html of msg)
	set p to (plain text content of msg)
	set r to "has_html=" & (h as text) & " plain_len=" & ((count of p) as text)
	try
		set r to r & " head=[" & (text 1 thru 90 of p) & "]"
	end try
	set opened to "no"
	try
		open msg
		set opened to "yes"
	end try
	return r & " opened=" & opened
end tell''' % (esc(subject), esc(html)))
PY

# --- 3. Run and verify ------------------------------------------------------
RESULT=$(osascript "$SCPT" 2>&1)
echo "$RESULT"

case "$RESULT" in
  *has_html=true*opened=yes*)
    echo ""
    echo "OK - draft open with the HTML rendered. Add recipients and schedule the send."
    ;;
  *)
    echo ""
    echo "FAILED - the body is probably empty or unrendered. Do NOT tell the user it worked."
    echo "Check SKILL.md: content must be set BEFORE 'open msg', and never passed"
    echo "inside 'make new outgoing message with properties'."
    exit 1
    ;;
esac
