---
title: "The Economy of Attention"
slug:  economy-of-attention
date:  2026-03-21
listed: false
---

*This is an early draft I'm sharing for feedback. Hit me with your thoughts! [Last updated](https://github.com/phinze/phinze.github.io/commits/main/_posts/2026-03-21-economy-of-attention.md): 2026-03-22 ~5:15pm CT.*

Ahoy, software-slinging mateys! There's a lot of foam on the water right now. AI is remaking how software gets built, and our whole industry is metabolizing the change in public. Maintainers are overwhelmed! Systems thinkers are drawing new diagrams! Individual developers are writing about how their own workflows feel different in ways they can't quite name! Is it a tailspin? An ouroboros of navel-gazing, the discourse eating its own tail? Or are we in a chrysalis, goo right now but about to emerge reformed and beautiful? So many takes! So many emotions! And rightly so. There's a lot to figure out.

All of which leaves a body looking for anchor points. Navigation buoys on the salty seas. Fundamentals that were always there and hold true even when everything on the surface is churning.

I've been calling mine **the economy of attention**.

Not "the attention economy" — that's the demand-side concept, who can capture your eyeballs. This is the supply side. Attention as a scarce resource that has to be _spent_ to produce anything of value. Think of it as a conservation law: the attention required to produce correct, understood software can't be created or destroyed, only moved around. If less is spent in one place, more has to be spent somewhere else.

AI has made generating code almost free. It has not made _understanding_ code any cheaper. That gap is the source of almost everything we're all feeling right now.

## Software is Dead Attention

Here's an old idea in new clothes: a software system is accumulated attention, crystallized into something useful.

Not lines of code. Not person-hours. Not story points. _Attention_. Someone had to understand a problem deeply enough to encode a solution, and then someone else had to understand that solution deeply enough to trust it, and then someone else had to understand the system deeply enough to change it without breaking what came before. Every layer of that understanding is attention, spent and compounded.

Time to bring in the big guy. Marx's [labor theory of value](https://en.wikipedia.org/wiki/Labor_theory_of_value) says the value of a commodity isn't the materials: it's the _socially necessary labor time_ embedded in it. His "labor" is broader than what I'm calling "attention" — in a factory, you can dig a ditch without thinking too hard and the ditch still gets dug. But in knowledge work, what labor is there _besides_ attention? You can't write code, design a system, debug a problem, or review a PR without sustained comprehension. The typing is trivial. In our domain, labor and attention converge. Marx was writing about factories; we're writing about software. But the theory fits like a glove. A codebase is what Marx would call dead labor: past understanding, crystallized. And when dead labor gets crystallized into something that produces value, Marx calls it _capital_. A working software system is attention capital. It's the accumulated comprehension of everyone who built it, frozen into an artifact that now generates value for the people who use it.

Why does this matter now? Because the _whole point_ of building software is to create an attention surplus for the people who use it. We spend attention building the thing so that users don't have to spend attention doing the thing the hard way. Technology is an attention transformer: living attention goes in on the building side, attention capital comes out, and that capital saves effort for everyone who uses it. The measure of a useful piece of software is that multiplier: how much attention was spent building it versus how much attention it saves across everyone who uses it.

The best software has a spectacular ratio. Years of focused human comprehension on the building side, millions of hours of saved effort on the usage side. That's the whole game. That's why we do this.

## My, Look at All This Discourse!

Once you see software as an attention economy with a conservation law, a lot of the current discourse snaps into focus. I've been reading a stack of recent posts, all circling the same thing from different angles: the attention has to be spent, and every apparent escape hatch just moves it somewhere else.

A Django maintainer recently wrote ["Give Django your time and money, not your tokens"](https://www.better-simple.com/django/2026/03/16/give-django-your-time-and-money/), a post that nails the problem from the receiving end. Open source maintainers are getting flooded with AI-generated contributions that cost the submitter almost nothing to produce and cost the reviewer _everything_ to evaluate.

The old implicit contract was roughly balanced. Writing a patch took effort. Submitting it meant you'd probably tested it, probably understood the codebase at least locally, probably cared enough to engage in review. The cost of producing the contribution was a natural filter for its quality, and — just as importantly — a signal of good faith. You'd spent attention. That meant something.

Now you can generate a plausible-looking patch in thirty seconds. The code might be correct. It might even be good. But **the reviewer has no way to know that without spending their own attention**, and their attention hasn't gotten any cheaper.

The conservation law is doing its thing. The attention cost of a correct patch didn't go down; the submitter's cost dropped to near-zero while the reviewer's stayed exactly the same. The asymmetry exploded. In Marxist terms, this is a familiar dynamic: the labor didn't disappear, it just stopped being shared. The maintainer now does the comprehension-work alone.

There's a common observation making the rounds lately ([one recent version](https://apenwarr.ca/log/20260316) is sharp on the diagnosis, though its conclusions are questionable): every layer of review you add to a process costs dramatically more than the last. AI makes generation faster, but generation was never the bottleneck. Review is the bottleneck. And review is slow because it's _attention-intensive_: someone has to actually understand what changed and why.

The booster-class response is obvious: just have the AI do the review too. Close the loop. AI generates, AI reviews, AI ships, value appears, no human attention required. You can practically hear the CEOs salivating: capital that generates value without labor, the one thing Marx said it couldn't do. "Take _that_, old man."

But review without understanding isn't review. It's just another layer of pattern-matching on top of the first layer of pattern-matching. A human reviewer catches problems because they bring directed attention: they understand the system, they know what _should_ be true, they can spot when something is technically correct but architecturally wrong. An AI reviewer can check syntax and run tests, but it can't know that this particular change undermines an invariant that three other services depend on, because nobody told it and it doesn't understand why the system is shaped the way it is.

And if nobody in the loop has that understanding, the attention debt doesn't vanish. It compounds silently until a support ticket is filed that the AI cannot resolve, because the fix requires knowing why the system was built the way it was, and nobody knows anymore, or never did. A human has to pay the debt all at once, with no context, under pressure. We've all had to dig into that one decrepit corner of the codebase that nobody remembers, tiptoeing through ancient ruins with a flashlight, hoping not to fall into a snake pit. Now imagine that's the _whole system_.

[Deming](https://en.wikipedia.org/wiki/W._Edwards_Deming) saw this decades ago in manufacturing: adding QA inspection layers _reduces_ individual accountability. When everyone knows there's another check downstream, they stop checking their own work. Review layers are attention-routing systems, and badly designed ones leak. The total attention spent might even go _down_.

There's a whole genre of post right now about spec-driven development: [write the spec, let the AI build it](https://haskellforall.com/2026/03/a-sufficiently-detailed-spec-is-code). Make the code [disposable and regenerable](https://aicoding.leaflet.pub/3majnyfydzs2y), keep only the intent. It's appealing. But as Gabriella Gonzalez (creator of [Dhall](https://dhall-lang.org/)) observes: a sufficiently detailed spec _is_ code. If you write a specification precise enough for an AI to generate correct code from it, you've already done the hard work. You've spent the attention. The spec didn't save you anything; it just moved where the attention went.

You can shuffle the apparent cost around: write a spec instead of code, generate a PR instead of typing it, use a framework that hides the complexity. And yes, you can have the AI write the spec too. Turtles all the way down! But the actual attention required to produce something _correct and understood_ doesn't compress. At some point someone has to actually understand the problem being solved.

Then there's the emotional layer. Developers are [comparing AI coding to gambling](https://notes.visaint.space/ai-coding-is-gambling/): pull the lever, get a result, pull again. It's "preposterously addicting" precisely because it removes the cognitive burden. Simon Willison and the Oxide folks have been calling it "[deep blue](https://simonwillison.net/2026/Feb/15/deep-blue/)," the existential dread underneath: _what was I even for?_ But the work also feels hollow. You're spending your time "mopping up how poorly things have been connected" rather than actually solving problems.

That hollow feeling is attention debt, experienced from the inside. Marx has a word for it: _[alienation](https://en.wikipedia.org/wiki/Marx%27s_theory_of_alienation)_. The worker separated from the product of their labor. When you vibe-code, you produce artifacts you don't understand. The slot machine gives you the dopamine of production without the satisfaction of comprehension.

The pattern repeats at every level. Submit it and the reviewer pays. Add review layers and they leak. Write specs instead and it's the same work in different clothes. Skip it entirely and it feels hollow. The attention has to be spent.

## Did You Spend the Attention?

I find the whole "which lines did the LLM write" discourse tiresome. I get the impulse — maintainers are drowning in low-effort slop and need some way to sift through it. But "did AI type this bit" is a bad proxy for what they actually care about. If the frame is useful, it should give us a better one: **did you spend at least as much attention as you're asking someone else to spend?**

That cuts through a lot of the nitpicking. For those of us experimenting with these tools — and that's what you do with new tools! — a culture that polices toolchains instead of outcomes creates fear around exactly the kind of experimentation we need right now.

(If you want to opt out of these tools entirely, I respect that. I share concerns about transparency, consent, attribution, and resource usage, and I feel the dissonance. I'll keep grappling, and maybe write about that grappling at some point. But right now I'm focused on the middle of the discourse: where are the lines for those of us who _do_ use these tools?)

The heuristic works across the whole spectrum of trust. On a high-trust team where you've built up a long history of deposits into the shared attention budget, the dials can be set differently. Your teammates know you. They've seen your judgment. When you say "Claude and I looked into this and here's what we found," that's a meaningful signal because they trust that _you_ actually spent the attention, regardless of who typed the characters. The AI is a tool in the hands of someone they trust.

First-time open source contributions are on the opposite end. The maintainer has no way to tell whether the person on the other end actually understands what they're submitting. Squinting at PRs for LLM-iness is a dead end. Better to focus on systems and norms that carry real signal: [webs of trust](https://github.com/mitchellh/vouch) that let humans vouch for humans, or disclosure norms that ask contributors to show up as themselves — "hi, human here, worked with Claude on this, I think it's right, please let me know." That's a person spending attention. You can work with that.

Cards on the table: I used LLMs heavily in writing this very post. You could dismiss it as slop because an LLM typed most of the prose, but my claim is there's something worthwhile in here. This is the result of [hours of back-and-forth](https://github.com/phinze/phinze.github.io/commits/main/_posts/2026-03-21-economy-of-attention.md) across multiple LLM sessions. I've typed thousands of words into those sessions; very few of them directly into my editor. If I had typed "yo Claude, read these five articles and give me a post that gets me into The Discourse" the result would have been thin, heavy on LLMisms, light on insight. The difference is the attention I brought to the process. Or at least I think so! If you think these ideas are wrong, I'd love to hear why — that's a conversation worth having. But if you'd dismiss them solely because an LLM touched the prose, I'll gently point out that you _did_ make it to the bottom of the piece. ;)

It's definitely still choppy out there; hard not to get a little seasick. But hey, at least I found this buoy, and we'll keep charting the seas together.

In [my next post](/writing/attention-capital) I take this frame and ask some new questions: what exactly is the AI industry selling us, and who should own the tools that amplify our attention?
