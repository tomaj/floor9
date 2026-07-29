# FLOOR 9 - Issue N°11

**Date:** Friday 4 September 2026
**Issue:** N°11
**Topic of this issue:** How to make your app better - a prompt you can steal, and 11 levers behind it

---

## HERO
- Kicker: FLOOR 9 · Digital & Omnichannel · N°11 · September 2026
- Title: FLOOR 9
- White line: Small nudges beat big rebuilds.
- Green line: This issue - one prompt to point at your own app, and 11 behavioral levers it looks for. Steal both.

## Lead
**Most engagement problems don't need a rebuild. They need a few small nudges in the right places - and now you can have AI find them in minutes.** The trick is giving it the right lens. Below is the exact prompt I use, plus the 11 behavioral levers behind it, each with one concrete change you could ship.

## A quick word
We tend to think "make the app better" means a big project. Usually it doesn't. The difference between an app people use once and one they come back to is often a handful of small moments: how a flow ends, whether progress is visible, how many choices sit on a screen. Those are studied, named things - not taste. And AI is very good at spotting where they're missing, if you tell it what to look for.

## The prompt (steal this)
Point Claude Code (or any assistant) at your app - the repo, a Figma, or just screenshots - and paste this:

> Look at this application and find where we can improve it for the user and for engagement. Go through these behavioral-design lenses (skip any that don't fit, don't force them): peak-end rule, Zeigarnik effect, goal-gradient + endowed progress, variable reward, flow (difficulty vs skill), curiosity gap, aesthetic-usability, IKEA effect, fresh-start effect, Hick's law, loss aversion. For each lens that fits: name the exact screen or flow, what's weak today, one concrete change, and roughly how hard it is to ship. Rank the ideas by impact-to-effort. Flag anything that would cross into a dark pattern and give me the ethical version instead.

Follow-up that works well: *"Take the top 3 and write them up as tickets with acceptance criteria."*

## The 11 levers (principle -> what to actually change)
1. **Peak-end rule** - people remember an experience by its most intense moment and its ending, not the average. Design one deliberate "wow" moment, and polish the last screen of every flow (success, confirmation, end of session). A great ending forgives a bumpy middle.
2. **Zeigarnik effect** - we keep thinking about unfinished tasks. Progress bars, "profile 80% complete", saved drafts. An open loop the brain wants to close.
3. **Goal-gradient + endowed progress** - the closer the goal, the harder we push. Start onboarding or loyalty already partly filled ("2 of 5 steps done"). People try harder on a path they feel already on.
4. **Variable reward** - an unpredictable reward is stickier than a regular one. An occasional surprise, bonus, or "you unlocked...". The honest line: reward real value, don't build a slot machine.
5. **Flow** - engagement lives just above the user's current skill. Not too easy (boredom), not too hard (frustration). Progressive disclosure: don't drown newcomers, don't bore power users.
6. **Curiosity gap** - a visible gap between what I know and want to know pulls me forward. "2 more steps and you'll see your result." A tease that pays off soon.
7. **Aesthetic-usability effect** - things that look better are perceived as easier to use and more trustworthy, even when they aren't functionally better. Visual polish is not decoration, it's perceived quality.
8. **IKEA effect** - we value what we helped build. Let users set something up or create something in onboarding - the attachment beats a ready-made product handed over.
9. **Fresh-start effect** - motivation rises at symbolic beginnings (new week, 1st of the month, birthday). Let people restart a streak or a goal without feeling like they failed.
10. **Hick's law** - more options = slower, more tiring decisions. Fewer choices per screen, sensible defaults, one primary action. Feels counterintuitive, raises satisfaction.
11. **Loss aversion** - losing something hurts more than gaining the same thing pleases. "Don't lose your streak" pulls harder than "earn a point". Ethical version: warn, don't coerce.

## Kept honest
- These levers are powerful, and the line between engagement and manipulation is thin. Variable reward + loss aversion are exactly the casino mechanics we wrote about in N°05 (Hooked). Use them to help the user get real value, not to trap them.
- AI will hand you 20 ideas in a minute. Prioritisation and ethics are still on you.
- An idea is not a shipped feature. The prompt is a starting point, not a finished product - and half the ideas won't survive contact with your actual users.

## What I'm chewing on
The interesting shift isn't the psychology - these effects have been in textbooks for decades. It's that the cost of *checking your product against all of them* just dropped to near zero. The bottleneck was never the knowledge, it was having someone sit down and look through eleven different lenses. That part is now a prompt. What's left for us is the judgement about which nudges are worth it, and which ones we'd be ashamed to ship.

## Sign-off
Run the prompt on something you own this week and reply with the one idea that surprised you. I'll collect the best ones for a follow-up. And if you catch me shipping a dark pattern, call it out - that's the deal.

- Tomas

---
*FLOOR 9 is a Friday dispatch from the Digital & Omnichannel SK tribe. Short, honest, occasionally useful.*
