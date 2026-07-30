# FLOOR 9 - Issue N°11

**Date:** Friday 4 September 2026
**Issue:** N°11
**Topic of this issue:** Better, faster apps - four patterns worth knowing, and a playbook of prompts that find them

---

## HERO
- Kicker: FLOOR 9 · Digital & Omnichannel · N°11 · September 2026
- Title: FLOOR 9
- White line: Great apps aren't luck. They're patterns.
- Green line: This issue - the design patterns you should know, and a playbook of prompts that find them in your own app.

## Lead
**Have you heard of the peak-end rule? The Zeigarnik effect? Hick's law?** If not - you probably should have. They're not trivia. They're the studied, named reasons some apps feel effortless and worth coming back to, while others - with the exact same features - feel like a chore. And the best part: you don't need a rebuild to use them, and AI can now find where they're missing in minutes.

## A quick word
We tend to think "make the app better" means a big project. Usually it doesn't. The difference between an app people use once and one they return to is often a handful of small, well-understood moments: how a flow ends, whether progress is visible, how many choices sit on one screen. These are documented patterns, not taste - and once you know their names, you start seeing them (or their absence) everywhere.

## 01 Patterns you should know
1. **Peak-end rule** - people judge an experience by its most intense moment and its ending, not the average. *Why it matters:* nail one "wow" moment and a clean final screen, and users remember the whole thing as good - even if the middle was bumpy.
2. **Zeigarnik effect** - we can't stop thinking about unfinished tasks. *Why it matters:* a visible "profile 80% complete" or a saved draft quietly pulls people back to finish, with zero nagging.
3. **Hick's law** - every extra choice on a screen slows the decision and tires the user. *Why it matters:* fewer options and one obvious primary action usually beat cramming in more - counterintuitive, but it lifts completion.
4. **Loss aversion** - losing something hurts about twice as much as gaining the same thing pleases. *Why it matters:* "don't lose your streak" motivates harder than "earn a point" - powerful, so use it to protect the user's progress, not to trap them.

**+8 And eight more.** Goal-gradient, variable reward, flow, curiosity gap, aesthetic-usability, IKEA effect, fresh-start and social proof. All twelve, with concrete examples, are in the playbook below.

## 02 The prompt (steal this)
Here's the thing: you don't have to memorise any of it. Point Claude Code (or any assistant) at your app - the repo, a Figma, or just screenshots - and paste this:

> Look at this application and find where we can improve it for the user and for engagement. Go through these behavioral-design lenses (skip any that don't fit): peak-end rule, Zeigarnik effect, goal-gradient + endowed progress, variable reward, flow, curiosity gap, aesthetic-usability, IKEA effect, fresh-start effect, Hick's law, loss aversion, social proof. For each lens that fits: name the exact screen or flow, what's weak today, one concrete change, and roughly how hard it is to ship. Rank the ideas by impact-to-effort. Flag anything that would cross into a dark pattern and give me the ethical version instead.

Follow-up that works well: *"Take the top 3 and write them up as tickets with acceptance criteria."*

## Bridge to the playbook
**That prompt fixes one thing: engagement. But it's rarely the only thing wrong with an app.**

The same trick - hand the assistant a proper checklist instead of a vague ask - works just as well on the slow query, the file nobody dares refactor, or the security hole nobody has found yet. So I collected the prompts I actually use into one place.

## 03 The playbook (and it's not just engagement)
I turned all of this into a small **prompt playbook** - point your AI assistant at an app, paste a prompt, get back concrete, ranked improvements. Engagement is only one of seven. The same playbook has prompts for:

- **Performance** - queries, N+1, React re-renders, bundle size
- **Security** - auth, injection, secrets, OWASP standards, headers
- **Refactoring** - readability, duplication, dead code, types
- **Modernization** - stack, framework patterns, dependencies, tooling
- **Usability** - clarity, errors, accessibility, forms
- **Functional / PRD** - coverage, edge states, test coverage

Each prompt lists the exact areas to check, why each matters, and real examples. Bilingual (EN/SK), copy-and-paste.

Do yourself a favour and open it for two minutes - skim the seven prompts, and take whichever one matches what you're wrestling with this week.

**Open the playbook:** https://decklink.sk.tmo/d/the-ai-audit-playbook

## Kept honest
- These patterns are powerful, and the line between engagement and manipulation is thin. Variable reward + loss aversion are the same casino mechanics we wrote about in N°05 (Hooked). Use them to help the user, not to trap them.
- AI will hand you 20 ideas in a minute. Prioritisation and ethics are still on you.
- An idea is not a shipped feature. The prompt is a starting point - half the ideas won't survive contact with your actual users, and that's fine.

## What I'm chewing on
The psychology isn't new - these effects have been in textbooks for decades. What's new is that the cost of checking your product against all of them just dropped to near zero. The bottleneck was never the knowledge; it was having someone sit down and look through every lens. That part is now a prompt. What's left for us is the judgement about which changes are worth it, and which ones we'd be ashamed to ship.

## Sign-off
Run one prompt on something you own this week and reply with the idea that surprised you most. I'll collect the best ones for a follow-up. And if you catch me shipping a dark pattern, call it out - that's the deal.

- Tomas

---
*FLOOR 9 is a Friday dispatch from the Digital & Omnichannel SK tribe. Short, honest, occasionally useful.*
