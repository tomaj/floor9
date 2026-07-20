# FLOOR 9 - Issue N°09

**Date:** Friday 24 July 2026
**Issue:** N°09
**Topic of this issue:** Bun's Rust rewrite - what one engineer + AI just pulled off

---

## HERO
- Kicker: FLOOR 9 · Digital & Omnichannel · N°09 · July 2026
- Title: FLOOR 9
- White line: A year of engineering, done in eleven days.
- Green line: This issue - a rewrite that would have taken a small team a full year, done in 11 days for the price of a mid-range car. Not our work. But worth sitting with.

## Lead
**This edition is about one thing - the story that lit up tech circles last week. I'd genuinely recommend reading the original write-up in full (linked at the end); what follows is my short version.**

If you know what Bun is, skip this line. If not - it's a JavaScript runtime, a faster stand-in for Node, used heavily across the industry. Anthropic acquired the whole thing back in December 2025 (yes - Claude Code is built on it).

But that's not the story. Bun's creator just rewrote the entire runtime - **535,496 lines of code** - from one programming language (Zig) to another (Rust). In **11 days**. With about **64 Claude agents** running in parallel. For roughly **$165,000** in API tokens. Work he says would otherwise take a small team a full year.

## Why rewrite at all
Bun was written in Zig - fast, but a young language with sharp edges. At Bun's scale the memory bugs stopped being rare: leaks, use-after-free, recurring crashes. Rust kills most of that class of bug at compile time. The catch: doing it by hand would cost a small team a full year, with bugfixes and features frozen the whole time.

## Stats (the headline)
- **535,496** - lines of code rewritten, Zig to Rust
- **11 days** - planning to merge
- **$165,000** - total API cost

## What 535,496 lines actually means
Half a million lines is hard to picture, so compare it to software you know:
- **4x** the entire first version of Photoshop (128k lines, 1990).
- **3x** the original Linux kernel (v1.0, ~176k lines, 1994).
- **About 1:1** with the whole Space Shuttle flight software (~500k lines).
- Printed, that's roughly 10,000 pages of source code.

## Before / after
**Before:** a small team, ~1 year, all bugfixes and features frozen for the duration.
**After:** one engineer directing ~64 Claude agents, 11 days - shipped as Bun v1.4.0 with 128 bugs fixed and a ~20% smaller binary.

## How they pulled it off (the interesting part)
This is the bit worth reading the article for. It wasn't "point AI at the repo and pray" - it was a disciplined pipeline:
1. **Plan first.** ~3 hours with Claude to write a 600-line porting guide - patterns, rules, gotchas - before touching a single file.
2. **Trial run.** Prove the approach on just 3 files first.
3. **Fan out.** About 64 Claudes at a time - 4 parallel workflows of 16 agents each - on a pre-release Claude Fable 5.
4. **Fix the build in a loop.** ~16,000 compiler errors chewed through automatically - roughly 12 hours of it.
5. **Then the slow part.** ~2 days to get the test suite green, ~3 days to full CI passing, with adversarial review throughout.
6. **Verify and merge.** Once everything was verified to work, it was merged.

*The one thing that made it possible: Bun's huge existing test suite. Without that safety net to catch every regression the 64 agents introduced, none of this would have been safe to ship.*

## What I'm chewing on
The headline here isn't Bun. It's the trade that just became real: a one-year rewrite for eleven days and the price of a luxury car. Whole classes of work we'd written off as "too big to ever touch" just quietly moved from *impossible* to *worth a serious look*. That's the part to sit with - not the runtime, but how much further one person can now reach.

None of which makes it free magic - it took an expert who knew the code cold, a test suite strong enough to trust, and $165k on an uncertain bet.

[Rewriting Bun in Rust - the original post](https://bun.com/blog/bun-in-rust) · [The Pragmatic Engineer's take](https://blog.pragmaticengineer.com/the-pulse-what-can-we-learn-from-buns-rapid-rust-rewrite-with-ai/)

## Sign-off
Got a legacy thing you always said was too big to ever touch? This is the week to reconsider whether that's still true. Tell me which one - I'm curious where the line actually is now.

- Tomas

---
*FLOOR 9 is a Friday dispatch from the Digital & Omnichannel SK tribe. Short, honest, occasionally useful.*
