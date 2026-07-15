# FLOOR 9 - Issue N°07

**Date:** Friday 10 July 2026
**Topic of this issue:** Loops

---

## HERO (the newsletter brand)
- Kicker: Digital & Omnichannel SK · Issue N°07 · July 2026
- Title: FLOOR 9
- White line: A look inside our kitchen. What we build, how we work, what we learn the hard way.
- Green line: This issue - One prompt. A functional app. Zero code written by hand.

## Hook / a quick word
**I stopped writing prompts that end with an answer.**

Last issue I teased it. This week I'll show you exactly how it works - and where it breaks. No theory, just a build that happened live, start to finish.

## 01 - Let's be honest first
AI coding is genuinely productive. It does an enormous amount of work on its own. But if you've used it for anything real, you know: **it doesn't always finish right.** It loses track. It skips things. It confidently says "done" when it isn't. The context keeps growing and the AI struggles to hold it all. We all experience this - it's the nature of LLMs, not a bug.

So we build tools and workflows around that reality. **The question isn't whether the AI is reliable - it's how to get reliable results from something that isn't.** That's what loops are.

## 02 - What changed
There's a new primitive in AI coding tools - and it changes the game. In Claude Code it's called **/goal**. You define a clear goal with measurable criteria, and the AI loops - iterating, testing, fixing - until the criteria are met. No hand-holding. No "try again." It just runs.

The shift sounds small but it isn't. A prompt ends with an answer. A loop ends with a working thing. That's a different kind of tool entirely. And it's precisely the answer to the unreliability from above - the AI might miss things on any single pass, but the loop keeps going until the criteria say it's done.

## 03 - 63 minutes, one loop, zero interventions
I wanted to build an app. Not a prototype, not a wireframe - a real, working, fully tested application. I wrote the PRD on my phone in the **Claude app**, designed the hi-fi visuals in **Claude Desktop** on my Mac.

Then I opened Claude Code in an **empty directory** - no existing code, no boilerplate, nothing - pointed it at the PRD and the design, and set a **/goal** with one relatively short prompt and measurable criteria: all features implemented, all tests green (unit, integration, e2e with Playwright).

That was it. **One prompt. From zero.** I hit Enter. Walked away. **63 minutes later the app was done.** Fully functional, fully tested, fully offline. Zero human interventions. Zero lines of code written by hand. One loop.

## 04 - Prompting vs. loop engineering
This is the mental shift. When you prompt, you're doing the work yourself - the AI is your assistant, you steer every step. When you set a /goal and run a loop, you're managing a worker. You define the outcome, set the guardrails, and let it converge.

Boris Cherny - the creator of Claude Code - put it this way in June: **"I don't prompt Claude anymore."** He sets goals. He runs loops. The quantity of iterations replaces the quality of any single prompt. The output is non-deterministic - you let it converge to the target instead of trying to nail it on the first shot.

That's the whole insight: **quantity over quality.** Don't polish one prompt. Set a clear finish line and let the loop run until it crosses it.

## Tweet of the week

> "We realized early on that asking an LLM to write a complex feature in one shot is setting it up for failure. The real magic of agentic coding happens inside the iterative loop."
>
> - [@4rblaber](https://x.com/4rblaber/status/2068454349815308582), quoting Boris Cherny

If you're still manually typing prompts, reading the diffs, and prompting again - you are the bottleneck. You set the end state. The agent writes, compiles, reads the error logs, and corrects itself recursively until the tests pass.

Full tweet: https://x.com/4rblaber/status/2068454349815308582

Worth watching - Boris Cherny on building Claude Code (90 min deep dive): https://www.youtube.com/watch?v=julbw1JuAz0

## Coming soon
That app I built in 63 minutes? You'll see it very soon. ;-)

## Sign-off
Last week I said "one prompt, a functional app." Turns out that wasn't quite right. It wasn't one prompt. It was one loop. And that's the whole point.

Happy to demo it over coffee. Seriously - bring a laptop, I'll show you live.

- Tomas

---
*FLOOR 9 is a Friday dispatch from the Digital & Omnichannel SK tribe. Short, honest, occasionally useful.*
