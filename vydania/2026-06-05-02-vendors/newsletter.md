# FLOOR 9 - Issue N°02

**Date:** Friday 5 June 2026
**Topic of this issue:** Stop paying vendors

---

## HERO (the newsletter brand)
- Kicker: Digital & Omnichannel SK · Issue N°02 · June 2026
- Title: FLOOR 9
- White line: A look inside our kitchen. What we build, how we work, what we learn the hard way.
- Green line: This issue - Stop paying vendors.

## Hook / a quick word
**Don't pay vendors a cent.**

For years we've handed vendors a huge amount of work - and paid a fortune for it. The more we wanted built, the more we paid. That era is over.

## 01 - What we actually pay for
For a decade we've paid vendors to deliver finished things on **fixed scope, fixed price** - the more we needed built, the bigger the invoice (and often a licence on top). That pricing was built for a world without AI. That world is over.

*(To be clear: vendors who give us **bodyshop** - real people working inside our teams - are a different conversation, and a fair one. This is about **paying for delivery of ready-made software**. That's the part that's ending.)*

The old game is finished. The only question left is what replaces it.

## 02 - What replaces it
Every vendor request now meets two answers - and a vendor has to win one of them:

1. **We build it ourselves.** With AI we ship things that used to take months.
2. **The vendor comes back at a tenth of the price** - because they use AI too, and deliver in weeks.

So here's what changes on our side, starting now:

- **Start at "build."** Before any quote goes anywhere, we scope what it costs to do it ourselves first.
- **Make every quote AI-priced.** Ask the vendor straight: what's this with AI? The bar is 1/10 the price and weeks, not quarters.
- **We keep all the source code.** We can't run on something a vendor owns and we can't even open - full access to everything, no vendor lock-in.
- **If the answer comes back in quarters, it's the wrong answer.** Speed is the default now, not a premium.

**This one's on all of us.** So push back on every quote - hard. Vendors already use AI; they can build in a fraction of the time, yet they still estimate and invoice the old way. Don't accept it. Ask for a **dramatically lower price, every single time** - and make them justify it. Every euro we don't challenge is money thrown straight out the window.

## Proof: Revo
**A vendor wanted `140k €` plus a forever licence. We built it ourselves in `2 weeks`.**

Retail wanted to record in-store conversations and analyse them with AI. The analytics engine (AIVA) already existed - we only needed a desktop tool that records through the microphone and uploads to a server. A vendor offered to build it on top of an existing solution for ~140k €, plus a licence fee we'd keep paying year after year. The catch: it was expected out of the Omnichannel budget - money we don't have.

So we didn't pay. One developer, prompting with Claude, had a first testable version in 2 weeks - despite nobody here having built this kind of app before. It runs distributed capture on the workplaces and central processing on GCP, feeding straight into AIVA.

## By the numbers
- 140k € vendor quote -> 2 weeks in-house
- 1 developer + Claude · ~260 h of recordings / day
- 35-37 workplaces recording in parallel · 100% under our control

## Kept honest
Revo isn't a finished, locked-down product - it's a working version we keep improving together with business, going live for testing in June. We had zero experience with this kind of app, so the first version is a starting point, not the finish line. But it's already proof: with AI we can deliver even what we've never done before - fast, cheap, and on our own terms.

## Tomi's Window
**Claude Opus 4.8** - anthropic.com/news/claude-opus-4-8
The new top model from Anthropic - the engine behind most of what you read about on Floor 9. Their own staff engineer put it well: *"noticeably better judgment - it asks the right questions, catches its own mistakes, pushes back when a plan isn't sound."* We've been running on it on Floor 9 for about a week now.
- ~4x less likely than the previous version to let flaws in its own code pass unremarked.
- New "effort control" - you choose how hard it thinks: higher effort to reason more deeply, lower to respond faster.
- The big one for us: **Dynamic Workflows** - it plans the work, then runs hundreds of parallel subagents in a single session and verifies its own outputs before reporting back. Built for codebase-scale migrations across hundreds of thousands of lines of code.
- Same price as Opus 4.7 - and fast mode is 3x cheaper than on previous models.

## Sign-off
Happy to go deeper over coffee any time. If a vendor quotes you something from here on, ping me before you reserve the budget - let's see what it costs to just build it.
Biggest credit goes to the team. I'm just the one writing it up.
- Tomas

---
*FLOOR 9 is a Friday dispatch from the Digital & Omnichannel SK tribe. Short, honest, occasionally useful.*
