# FLOOR 9 - Issue N°01

**Date:** Friday 29 May 2026
**Topic of this issue:** Operation Armageddon

---

## HERO (the newsletter brand)
- Kicker: Digital & Omnichannel SK · Issue N°01 · May 2026
- Title: FLOOR 9
- White line: A look inside our kitchen.
- Green line: First up - Operation Armageddon.

## Welcome (issue #1 only - the origin story)
In my last 360 round, a lot of you said the same thing - you'd like to look inside the Digital & Omnichannel SK kitchen. So here it is.

FLOOR 9 is a short, honest dispatch from the 9th floor - the real thing, including the parts that hurt. And it works both ways: if there's something you want me to open up, just say.

## In this issue: Operation Armageddon
**We pulled Liferay off the internet. The apocalypse didn't happen.**

The board decided to shut down our Liferay - it had become a security risk. The catch: our fix prolongation journeys ran on it, and losing them meant ~800k in damage.

So we went into the 15-year-old legacy code, lifted out what mattered and rebuilt it as a clean Spring Boot app - no vulnerable Liferay underneath. We leaned hard on Claude Code, which is why it took weeks, not months.

## Size of the operation
- ~350k Java LoC processed
- 876 device pages to Storyblok
- 30k+ requests/day on Storyblok

## How we did it
- **Frontend - copied.** Same UI, no redesign.
- **Backends + PostgreSQL - kept.** Everything we already use stayed in place.
- **Logic - lifted into Spring Boot.** One new app replaced Liferay's entire API and business logic.
- ~350,000 LoC in -> ~35,000 LoC backend out · 10x less code.

## Kept honest
- Still putting out fires as they surface - mostly old image/content references piled up in Liferay over 15 years. We also broke the M2M B2B portal login, which hung off Liferay too.
- What I'd do differently: be bolder and start it a month or two earlier, on our own initiative, before it ever had to reach the board.

## Tomi's Window
**Paperclip** - paperclip.ing
An app to run a whole team of AI agents like a company - org chart, roles, budgets, governance, goals. You manage outcomes, not prompts.
Imagine a world where you write down what you want your agent-company to do, hand them a goal, and they get to work together - talking to each other, creating their own tasks, coding, posting to social. Fully autonomous, within whatever you let them touch.
- A wild glimpse of where AI is heading - this kind of thing will be everywhere before long.
- And it's not alone - similar projects are popping up constantly.
- On Floor 9 we already have it running - a few people are building things with it.
- Warning: it eats tokens like crazy - be extra careful.

## Sign-off
Happy to go deeper over coffee any time. And if you have a story where AI saved your week, or quietly sank it, send it.
Biggest credit goes to the team. I'm just the one writing it up.
- Tomáš

---
*FLOOR 9 is a Friday dispatch from the Digital & Omnichannel SK tribe. Short, honest, occasionally useful.*
