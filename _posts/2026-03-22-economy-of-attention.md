---
title: "The Economy of Attention"
slug:  economy-of-attention
date:  2026-03-22
listed: false
---

*This is an early draft I'm sharing for feedback. Please don't share widely, and hit me with your thoughts! [Last updated](https://github.com/phinze/phinze.github.io/commits/main/_posts/2026-03-22-economy-of-attention.md): 2026-03-22 ~10am CT.*

There's a lot of foam on the water right now. AI is remaking how software gets built, and our whole industry is metabolizing the change in public. Maintainers are overwhelmed! Systems thinkers are drawing new diagrams! Individual developers are writing about how their own workflows feel different in ways they can't quite name! Is it a tailspin? An ouroboros of navel-gazing, the discourse eating its own tail? Or are we in a chrysalis, goo right now but about to emerge reformed and beautiful? So many takes! So many emotions! And rightly so. There's a lot to figure out.

All of which leaves a body looking for anchor points. Navigation buoys on the salty seas. Fundamentals that were always there and hold true even when everything on the surface is churning.

I've been calling mine **the economy of attention**.

Not "the attention economy" — that's the demand-side concept, who can capture your eyeballs. This is the supply side. Attention as a scarce resource that has to be _spent_ to produce anything of value. Think of it as a conservation law: the attention required to produce correct, understood software can't be created or destroyed, only moved around. If less is spent in one place, more has to be spent somewhere else.

AI has made generating code almost free. It has not made _understanding_ code any cheaper. That gap is the source of almost everything we're all feeling right now.

## Dead Attention

An old idea in new clothes: a software system is accumulated attention, crystallized into something useful.

Not lines of code. Not person-hours. Not story points. _Attention_. Someone had to understand a problem deeply enough to encode a solution, and then someone else had to understand that solution deeply enough to trust it, and then someone else had to understand the system deeply enough to change it without breaking what came before. Every layer of that understanding is attention, spent and compounded.

Marx would recognize this immediately. His [labor theory of value](https://en.wikipedia.org/wiki/Labor_theory_of_value) says the value of a commodity isn't the materials: it's the _socially necessary labor time_ embedded in it. Software is the same, with a substitution. The value isn't the text of the code, it's the comprehension-labor embedded in it. A codebase is dead labor: past understanding, crystallized.

There's even a hilariously literal version of this in software economics. The [COCOMO model](https://en.wikipedia.org/wiki/COCOMO) estimates a codebase's "value" by computing the person-hours it would take to reproduce, then multiplying by a blended labor rate. It's crude. It's also accidentally Marxist. It was groping toward this truth: the value is the embedded attention. The hours were always just a proxy.

Why does this matter now? Because the _whole point_ of building software is to create an attention surplus for the people who use it. We spend attention building the thing so that users don't have to spend attention doing the thing the hard way. Technology is an attention transformer. Attention in on the building side, attention savings out on the usage side. The measure of a useful piece of software is that multiplier: how much attention was spent building it versus how much attention it saves across everyone who uses it.

The best software has a spectacular ratio. Years of focused human comprehension on the building side, millions of hours of saved effort on the usage side. That's the whole game. That's why we do this.

## Look at All This Discourse

Once you see software as an attention economy with a conservation law, a lot of the current discourse snaps into focus. I've been reading a stack of recent posts, all circling the same thing from different angles: the attention has to be spent, and every apparent escape hatch just moves it somewhere else.

A Django maintainer recently wrote ["Give Django your time and money, not your tokens"](https://www.better-simple.com/django/2026/03/16/give-django-your-time-and-money/), a post that nails the problem from the receiving end. Open source maintainers are getting flooded with AI-generated contributions that cost the submitter almost nothing to produce and cost the reviewer _everything_ to evaluate.

The old implicit contract was roughly balanced. Writing a patch took effort. Submitting it meant you'd probably tested it, probably understood the codebase at least locally, probably cared enough to engage in review. The cost of producing the contribution was a natural filter for its quality, and — just as importantly — a signal of good faith. You'd spent attention. That meant something.

Now you can generate a plausible-looking patch in thirty seconds. The code might be correct. It might even be good. But **the reviewer has no way to know that without spending their own attention**, and their attention hasn't gotten any cheaper.

The conservation law is doing its thing. The attention cost of a correct patch didn't go down; the submitter's cost dropped to near-zero while the reviewer's stayed exactly the same. The asymmetry exploded. In Marxist terms, this is a familiar dynamic: the labor didn't disappear, it just stopped being shared. The maintainer now does the comprehension-work alone. (It's telling that people are already building [explicit trust systems](https://github.com/mitchellh/vouch) to replace the implicit filter that effort used to provide.)

There's a common observation making the rounds lately ([one recent version](https://apenwarr.ca/log/20260316) is sharp on the diagnosis, though its conclusions are questionable): every layer of review you add to a process costs dramatically more than the last. AI makes generation faster, but generation was never the bottleneck. Review is the bottleneck. And review is slow because it's _attention-intensive_: someone has to actually understand what changed and why.

The booster-class response is obvious: just have the AI do the review too. Close the loop. AI generates, AI reviews, AI ships, value appears, no human attention required. You can practically hear the CEOs salivating: capital that generates value without labor, the one thing Marx said it couldn't do. "Take _that_, old man."

But review without understanding isn't review. It's just another layer of pattern-matching on top of the first layer of pattern-matching. A human reviewer catches problems because they bring directed attention: they understand the system, they know what _should_ be true, they can spot when something is technically correct but architecturally wrong. An AI reviewer can check syntax and run tests, but it can't know that this particular change undermines an invariant that three other services depend on, because nobody told it and it doesn't understand why the system is shaped the way it is.

And if nobody in the loop has that understanding, the attention debt doesn't vanish. It compounds silently until a support ticket is filed that the AI cannot resolve, because the fix requires knowing why the system was built the way it was, and nobody knows anymore, or never did. A human has to pay the debt all at once, with no context, under pressure.

[Deming](https://en.wikipedia.org/wiki/W._Edwards_Deming) saw this decades ago in manufacturing. Adding QA inspection layers _reduces_ individual accountability. When everyone knows there's another check downstream, they stop checking their own work. The layers don't compound quality; they dilute responsibility. Nobody feels like quality is their job.

Review layers are attention-routing systems, and badly designed ones leak. When you add a QA layer, you're not adding attention to the system. You're spreading the same attention thinner across more people, each of whom feels less ownership. The total attention spent might even go _down_. Marx saw the same thing in the factory: subdividing labor increases throughput but alienates the worker from the product. Quality suffers because nobody holds the whole thing in their head anymore.

There's a whole genre of post right now about spec-driven development: [write the spec, let the AI build it](https://haskellforall.com/2026/03/a-sufficiently-detailed-spec-is-code). Make the code [disposable and regenerable](https://aicoding.leaflet.pub/3majnyfydzs2y), keep only the intent. It's appealing. But as Gabriella Gonzalez (creator of [Dhall](https://dhall-lang.org/)) observes: a sufficiently detailed spec _is_ code. If you write a specification precise enough for an AI to generate correct code from it, you've already done the hard work. You've spent the attention. The spec didn't save you anything; it just moved where the attention went.

You can shuffle the apparent cost around: write a spec instead of code, generate a PR instead of typing it, use a framework that hides the complexity. And yes, you can have the AI write the spec too. Turtles all the way down. But the actual attention required to produce something _correct and understood_ doesn't compress. At some point someone has to actually understand the problem being solved.

Then there's the emotional layer. Developers are [comparing AI coding to gambling](https://notes.visaint.space/ai-coding-is-gambling/): pull the lever, get a result, pull again. It's "preposterously addicting" precisely because it removes the cognitive burden. Simon Willison coined "[deep blue](https://simonwillison.net/2026/Feb/15/deep-blue/)" for the existential dread underneath: _what was I even for?_ But the work also feels hollow. You're spending your time "mopping up how poorly things have been connected" rather than actually solving problems.

That hollow feeling is attention debt, experienced from the inside. Marx has a word for it: _[alienation](https://en.wikipedia.org/wiki/Marx%27s_theory_of_alienation)_. The worker separated from the product of their labor. When you vibe-code, you produce artifacts you don't understand. The hollow feeling is the experience of being alienated from your own output. The slot machine gives you the dopamine of production without the satisfaction of comprehension.

"Vibe coding" works for prototypes and breaks for production systems. A prototype has low attention stakes: nobody else depends on it, nobody has to review it, nobody has to maintain it. The economy balances even with minimal attention spent. But a production system that other people rely on is a _shared_ attention budget, and withdrawals without deposits are felt by everyone downstream.

The pattern repeats at every level. Submit it and the reviewer pays. Add review layers and they leak. Write specs instead and it's the same work in different clothes. Skip it entirely and it feels hollow. The attention has to be spent.

## Did You Spend the Attention?

If the frame is useful, it should produce a simple rule of thumb: **did you spend at least as much attention as you're asking someone else to spend?**

This works across the whole spectrum of trust contexts. On a high-trust team where you've built up a long history of deposits into the shared attention budget, the dials can be set differently. Your teammates know you. They've seen your judgment. When you say "Claude and I looked into this and here's what we found," that's a meaningful signal because they trust that _you_ actually spent the attention, regardless of who typed the characters. The AI is a tool in the hands of someone they trust.

First-time open source contributions are on the opposite end of the trust spectrum. You have no history. No deposits. The only signal the maintainer has is the contribution itself and the interaction around it. An AI-generated PR with a generated description is asking someone to spend scarce attention evaluating work that _appears_ to have cost you nothing. Even if you actually spent thirty minutes in a careful back-and-forth with an AI, the artifact doesn't show that. The economy doesn't balance from the reviewer's perspective.

This isn't about whether AI touched the code. I find the whole "which lines did the LLM write" discourse tiresome and counterproductive. If you want to opt out of these tools entirely, I respect that, genuinely. But for the rest of us who are experimenting — and that's what you do with new tools! — a culture that polices toolchains instead of outcomes creates fear around exactly the kind of experimentation we need right now. The question that matters is whether a human spent sufficient attention. And "sufficient" is relative to how much attention you're asking from others.

LLMs are _amplifiers_ for directed human attention, not _replacements_ for it. When a knowledgeable human aims the model at a problem they understand, the diffuse patterns get focused by the human's comprehension. That's powerful. But when nobody in the loop understands the problem, you get plausible output aimed at nothing. The attention has to be spent. The tools just change how efficiently you can spend it.

*This is the first of two posts. The second, [The Spice Shaker](/writing/spice-shaker), picks up the frame and asks: what's being sold to us, and who should own the tools?*
