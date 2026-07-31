---
name: open-in-outlook
description: Open a finished newsletter as a ready-to-send Outlook for Mac draft with the HTML rendered in the body. Use when asked to open an issue in Outlook, prepare the email, or set up the send/schedule (e.g. "otvor mi to v outlooku", "priprav mail na poslanie", "open the newsletter in Outlook").
---

# Open a newsletter as an Outlook draft

Run the helper - it handles cleanup, the correct call order, and verification:

```
.claude/skills/open-in-outlook/open-draft.sh <path-to-newsletter.html> "<subject>"
```

Example:

```
.claude/skills/open-in-outlook/open-draft.sh \
  vydania/2026-09-04-11-engagement-psychology/newsletter.html \
  "FLOOR 9 · Issue N°11 - Great apps aren't luck. They're patterns."
```

Subject convention: `FLOOR 9 · Issue N°XX - <Title>`.

Do this **after** the DeckLink upload, so the draft already contains the "Read online" link.

## The call order is load-bearing

Inside the script, and if you ever write this by hand:

1. `make new outgoing message` - **no properties**
2. `set subject of msg to "..."`
3. `set content of msg to "<the full HTML>"`
4. **only then** `open msg`

Both other orderings fail in ways that look like Outlook doesn't support HTML bodies at all:

- Passing `content` inside `make new outgoing message with properties {...}` **does** set the body, but immediately invalidates the reference - `open msg` then dies with `-1728 Can't get outgoing message id N`, so no window appears. Symptom the user sees: nothing opened, or an unrelated empty window.
- Calling `open msg` before `set content` makes the assignment fail: `Can't set outgoing message id N to "<!DOCTYPE html>..."`. Symptom: a new mail window with an empty body.

## Verify - never report success blind

The script checks this and exits non-zero if it fails. If verifying by hand:

- `has html of msg` must be `true`
- `plain text content of msg` must be readable prose (~6.5k chars for a full issue)

**Do not judge by reading `content` back.** It returns the raw HTML source (`<!DOCTYPE html>...`, ~26k chars) even when the body rendered perfectly. That misread once led to wrongly concluding the whole approach was impossible.

Screen verification is unavailable: `screencapture` is blocked (no Screen Recording permission), so the AppleScript read-back is the only evidence. Say plainly what was verified.

## Dead ends - do not retry

- **GUI paste via System Events** (`keystroke "v" using command down`): blocked with `osascript is not allowed to send keystrokes (1002)` because Warp lacks Accessibility permission. Loading the clipboard with `set the clipboard to «data HTML...»` works, but only a human can press Cmd+V.
- **`.eml` with `X-Unsent: 1`**: a Windows-Outlook feature. On macOS it opens a read-only preview that cannot be sent.
- **`save msg`**: fails with `-1701` (wants a file destination); AppleScript will not put the draft in the Drafts folder. The open compose window is the deliverable.

## Cleanup

Failed attempts leave several identically titled compose windows behind. The script closes every window whose name contains the first 40 characters of the subject (`close w saving no`) before creating a fresh one, so exactly one correct window remains. Saved drafts from earlier issues live as `outgoing messages`, not windows, and are untouched.
