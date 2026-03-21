---
title: "AI and the Means of Attention"
slug:  economy-of-attention
date:  2026-03-21
listed: false
---

*This is an early draft I'm sharing for feedback. Please don't share widely, and hit me with your thoughts! [Last updated](https://github.com/phinze/phinze.github.io/commits/main/_posts/2026-03-21-economy-of-attention.md): 2026-03-21 ~3pm CT.*

There's a lot of foam on the water right now. AI is remaking how software gets built, and our whole industry is metabolizing the change in public. Maintainers are overwhelmed! Systems thinkers are drawing new diagrams! Individual developers are writing about how their own workflows feel different in ways they can't quite name! Is it a tailspin? An ouroboros of navel-gazing, the discourse eating its own tail? Or are we in a chrysalis, goo right now but about to emerge reformed and beautiful? So many takes! So many emotions! And rightly so. There's a lot to figure out.

All of which leaves a body looking for anchor points. Navigation buoys on the salty seas. Fundamentals that were always there and hold true even when everything on the surface is churning.

Here's one that's helped me: **the economy of attention**.

Not "the attention economy" — that's the demand-side concept, who can capture your eyeballs. This is the supply side. Attention as a scarce resource that has to be _spent_ to produce anything of value. Think of it as a conservation law: the attention required to produce correct, understood software can't be created or destroyed, only moved around. If less is spent in one place, more has to be spent somewhere else.

AI has made generating code almost free. It has not made _understanding_ code any cheaper. That gap is the source of almost everything we're all feeling right now.

## Dead Attention

Here's an old idea in new clothes: a software system is accumulated attention, crystallized into something useful.

Not lines of code. Not person-hours. Not story points. _Attention_. Someone had to understand a problem deeply enough to encode a solution, and then someone else had to understand that solution deeply enough to trust it, and then someone else had to understand the system deeply enough to change it without breaking what came before. Every layer of that understanding is attention, spent and compounded.

Marx would recognize this immediately. His [labor theory of value](https://en.wikipedia.org/wiki/Labor_theory_of_value) says the value of a commodity isn't the materials: it's the _socially necessary labor time_ embedded in it. Software is the same, with a substitution. The value isn't the text of the code, it's the comprehension-labor embedded in it. A codebase is dead labor: past understanding, crystallized.

There's even a hilariously literal version of this in software economics. The [COCOMO model](https://en.wikipedia.org/wiki/COCOMO) estimates a codebase's "value" by computing the person-hours it would take to reproduce, then multiplying by a blended labor rate. It's crude. It's also accidentally Marxist. It was groping toward this truth: the value is the embedded attention. The hours were always just a proxy.

And here's why this matters now: the _whole point_ of building software is to create an attention surplus for the people who use it. We spend attention building the thing so that users don't have to spend attention doing the thing the hard way. Technology is an attention transformer. Attention in on the building side, attention savings out on the usage side. The measure of a useful piece of software is that multiplier: how much attention was spent building it versus how much attention it saves across everyone who uses it.

The best software has a spectacular ratio. Years of focused human comprehension on the building side, millions of hours of saved effort on the usage side. That's the whole game. That's why we do this.

## Look at All This Discourse

Once you see software as an attention economy with a conservation law, a lot of the current discourse snaps into focus. I've been reading a stack of recent posts, all circling the same thing from different angles: the attention has to be spent, and every apparent escape hatch just moves it somewhere else.

A Django maintainer recently wrote ["Give Django your time and money, not your tokens"](https://www.better-simple.com/django/2026/03/16/give-django-your-time-and-money/), a post that nails the problem from the receiving end. Open source maintainers are getting flooded with AI-generated contributions that cost the submitter almost nothing to produce and cost the reviewer _everything_ to evaluate.

The old implicit contract was roughly balanced. Writing a patch took effort. Submitting it meant you'd probably tested it, probably understood the codebase at least locally, probably cared enough to engage in review. The cost of producing the contribution was a natural filter for its quality, and — just as importantly — a signal of good faith. You'd spent attention. That meant something.

Now you can generate a plausible-looking patch in thirty seconds. The code might be correct. It might even be good. But **the reviewer has no way to know that without spending their own attention**, and their attention hasn't gotten any cheaper.

The conservation law is doing its thing. The attention cost of a correct patch didn't go down; it got transferred from the submitter to the reviewer. In Marxist terms, this is a classic move: the labor didn't disappear, it was displaced onto someone with less power in the transaction. The maintainer now does the comprehension-work the submitter skipped. (It's telling that people are already building [explicit trust systems](https://github.com/mitchellh/vouch) to replace the implicit filter that effort used to provide.)

There's a common observation making the rounds lately ([one recent version](https://apenwarr.ca/log/20260316) is sharp on the diagnosis, though its conclusions are questionable): every layer of review you add to a process costs dramatically more than the last. AI makes generation faster, but generation was never the bottleneck. Review is the bottleneck. And review is slow because it's _attention-intensive_: someone has to actually understand what changed and why.

The booster-class response is obvious: just have the AI do the review too. Close the loop. AI generates, AI reviews, AI ships, value appears, no human attention required. You can practically hear the CEOs salivating: capital that generates value without labor, the one thing Marx said it couldn't do. "Take _that_, old man."

But review without understanding isn't review. It's just another layer of pattern-matching on top of the first layer of pattern-matching. A human reviewer catches problems because they bring directed attention: they understand the system, they know what _should_ be true, they can spot when something is technically correct but architecturally wrong. An AI reviewer can check syntax and run tests, but it can't know that this particular change undermines an invariant that three other services depend on, because nobody told it and it doesn't understand why the system is shaped the way it is.

And if nobody in the loop has that understanding, the attention debt doesn't vanish. It compounds silently until a support ticket is filed that the AI cannot resolve, because the fix requires knowing why the system was built the way it was, and nobody knows anymore, or never did. A human has to pay the debt all at once, with no context, under pressure.

[Deming](https://en.wikipedia.org/wiki/W._Edwards_Deming) saw this decades ago in manufacturing. Adding QA inspection layers _reduces_ individual accountability. When everyone knows there's another check downstream, they stop checking their own work. The layers don't compound quality; they dilute responsibility. Nobody feels like quality is their job.

Review layers are attention-routing systems, and badly designed ones leak. When you add a QA layer, you're not adding attention to the system. You're spreading the same attention thinner across more people, each of whom feels less ownership. The total attention spent might even go _down_. Marx saw the same thing in the factory: subdividing labor increases throughput but alienates the worker from the product. Quality suffers because nobody holds the whole thing in their head anymore.

There's a whole genre of post right now about spec-driven development: [write the spec, let the AI build it](https://haskellforall.com/2026/03/a-sufficiently-detailed-spec-is-code). Make the code [disposable and regenerable](https://aicoding.leaflet.pub/3majnyfydzs2y), keep only the intent. It's appealing. But as Gabriella Gonzalez (creator of [Dhall](https://dhall-lang.org/)) observes: a sufficiently detailed spec _is_ code. If you write a specification precise enough for an AI to generate correct code from it, you've already done the hard work. You've spent the attention. The spec didn't save you anything; it just moved where the attention went.

This is attention laundering. You can shuffle the apparent cost around: write a spec instead of code, generate a PR instead of typing it, use a framework that hides the complexity. And yes, you can have the AI write the spec too. Turtles all the way down. But the actual attention required to produce something _correct and understood_ doesn't compress. At some point someone has to actually understand the problem being solved.

Then there's the emotional layer. Developers are [comparing AI coding to gambling](https://notes.visaint.space/ai-coding-is-gambling/): pull the lever, get a result, pull again. It's "preposterously addicting" precisely because it removes the cognitive burden. Simon Willison coined "[deep blue](https://simonwillison.net/2026/Feb/15/deep-blue/)" for the existential dread underneath: _what was I even for?_ But the work also feels hollow. You're spending your time "mopping up how poorly things have been connected" rather than actually solving problems.

This is what attention debt feels like from the inside. And Marx has a word for it: _[alienation](https://en.wikipedia.org/wiki/Marx%27s_theory_of_alienation)_. The worker separated from the product of their labor. When you vibe-code, you produce artifacts you don't understand. The hollow feeling is the experience of being alienated from your own output. The slot machine gives you the dopamine of production without the satisfaction of comprehension.

This is why "vibe coding" works for prototypes and breaks for production systems. A prototype has low attention stakes: nobody else depends on it, nobody has to review it, nobody has to maintain it. The economy balances even with minimal attention spent. But a production system that other people rely on is a _shared_ attention budget, and withdrawals without deposits are felt by everyone downstream.

The pattern repeats at every level. Submit it and the reviewer pays. Add review layers and they leak. Write specs instead and it's the same work in different clothes. Skip it entirely and it feels hollow. The attention has to be spent.

## The Spice Shaker

And of course, there's a pitch being made that solves all of these problems at once. The frontier model companies, the LinkedIn-consultant-CEO-AI-booster class, a thousand breathless threads, all selling the same dream: the LLMs have ingested a hyperdimensional superset of all the attention ever paid into their massive training corpora. All that accumulated human comprehension, distilled into an API. Shake the shaker, get the flavor. Pay by the token for the privilege.

And in a way, from a certain angle, they kinda do? LLMs really have encoded patterns from an enormous volume of human thought. The model really can produce things that look like the output of comprehension. The spice shaker really does taste like something.

But what comes out is _diffuse_ attention, not _directed_ attention. The model has seen a million solutions to problems that look vaguely like yours. It hasn't verified that any of them actually work in your specific context. A good software product says "we understood this problem and here's the solution." The spice shaker says "this looks like what solutions to problems like yours usually look like." The flavor without the nutrition.

This is why LLMs work beautifully as _amplifiers_ for directed human attention and badly as _replacements_ for it. When a knowledgeable human aims the model at a problem they understand, the diffuse patterns get focused by the human's comprehension. That's powerful. But when nobody in the loop understands the problem, you get plausible output aimed at nothing. (Sure, the AI-heads will say: fine, we'll train more directed models, let a thousand flowers bloom. Maybe! But each of those flowers will need its own directed attention to cultivate. The conservation law doesn't care how many models you train.)

Marx would call the broader pitch [commodity fetishism](https://en.wikipedia.org/wiki/Commodity_fetishism): mistaking the product for the labor that produced it. The pitch collapses the distinction between "pattern-matched against a corpus of human comprehension" and "comprehended." Those are not the same thing. One is a product. The other is a process. The product can be bought and sold. The process has to be lived through.

The logical extreme of this pitch is the "SaaSpocalypse," the market-level panic that every SaaS product is just one `.md` file away from being replaced by a Claude skill. Nearly a trillion dollars in software market cap wiped out on the premise that all the accumulated attention baked into these products can be reproduced by shaking the shaker hard enough.

There's a site called [Death by Clawd](https://deathbyclawd.com/) that's savage, funny, and — intentionally or not — a perfect satire of the hysteria. You feed it a company URL and it generates a fake death certificate, a replacement SKILL.md file, and a eulogy. Replacement cost: ~$0.003 per run. Cause of death: "Claude learned to do it better than your silly little web app."

I ran it on [Miren](https://deathbyclawd.com?url=miren.dev), the infrastructure platform I work on. It gave us a 38/100 survival score, a eulogy that begins "Dearly beloved, we gather here to remember Miren — a platform that dared to ask, 'What if Heroku, but again, but this time we call it modern?'" and a 31-line SKILL.md that generates Dockerfiles and Terraform configs.

It's hilarious. It's also commodity fetishism in action. What the 31-line file can't reproduce is two years of accumulated attention from people who care about making deployment feel like a non-event. The design choices that make CI auth work without storing secrets. The UX decisions about what a developer should be thinking about (their app) versus what they shouldn't (load balancer configs). That's craft: human experience and taste, exported so others can benefit. The SKILL.md can generate configs. It can't generate taste. It took years of experience and years of attention to know what to build. (Or I'm wrong and we're killed in a year by a chatbot. Only time will tell!)

The taxonomy of survivors and casualties is telling, too. The companies that score well are the ones where the accumulated attention is _deeply embedded_: physical infrastructure, regulatory knowledge, things you can't pattern-match your way through. The ones sweating are workflow abstractions where the attention was always thinner, always closer to the shape that an LLM can reproduce.

But here's the thing — and I think the Marxist in me has to say it — some of that sweating is _deserved_. If your business model was milking a fat margin off a sliver of information asymmetry, if the "value" you provided was mostly gatekeeping knowledge that's now freely accessible, then the conservation law is telling you something you maybe didn't want to hear: you never had that much accumulated attention in the first place. Your moat was opacity, not depth. The spice shaker _can_ reproduce thin attention. That's not a bug in the model. That's the forces of production disrupting the relations of production. That's how it's supposed to work.

If LLMs democratize knowledge and capability, if they make it so a solo developer or a tiny team can do things that used to require an enterprise sales call, I'm all for it. That's [the world I'm helping build toward at work](https://miren.dev) anyway. Shake that shaker. Disrupt away.

## Amplifier or Replacement

If AI helps you _skip_ attention, if nobody actually understands the thing that shipped, the product degrades. Buggy, confusing, unreliable software doesn't save user attention. It _costs_ user attention. The multiplier inverts. You've produced something that consumes more attention than it saves, and at that point it's not really technology in any real sense. It's just generated stuff that someone downstream has to deal with.

But if AI helps you spend attention more _effectively_, automating the mechanical work so you can focus your comprehension on the parts that matter, the multiplier improves. More attention-saving delivered to users per unit of attention spent building. That's good. That's technology doing what technology is supposed to do.

The distinction isn't whether AI was involved. It's whether the humans in the loop spent enough attention to ensure the output is understood, not just functional. The socially necessary attention, in Marx's framing, for the thing to have real use-value.

## Did You Spend the Attention?

If the frame is useful, it should produce a simple rule of thumb. Here's mine: **did you spend at least as much attention as you're asking someone else to spend?**

This works across the whole spectrum of trust contexts. On a high-trust team where you've built up a long history of deposits into the shared attention budget, the dials can be set differently. Your teammates know you. They've seen your judgment. When you say "Claude and I looked into this and here's what we found," that's a meaningful signal because they trust that _you_ actually spent the attention, regardless of who typed the characters. The AI is a tool in the hands of someone they trust.

First-time open source contributions are on the opposite end of the trust spectrum. You have no history. No deposits. The only signal the maintainer has is the contribution itself and the interaction around it. An AI-generated PR with a generated description is asking someone to spend scarce attention evaluating work that _appears_ to have cost you nothing. Even if you actually spent thirty minutes in a careful back-and-forth with an AI, the artifact doesn't show that. The economy doesn't balance from the reviewer's perspective.

This isn't about whether AI touched the code. It's about whether a human spent sufficient attention. And "sufficient" is relative to how much attention you're asking from others.

## Who Owns the Means of Attention

The big question isn't whether the conservation law holds. It's who controls the infrastructure that attention flows through.

Right now, the frontier models are controlled by a handful of companies, and the per-token pricing model is — if we're being honest about it — a new form of rent extraction. The entire corpus of human attention, scraped and compressed, sold back to us at metered rates. The landlord changed, but the structure is familiar. Marx would recognize this one too: enclosure of the commons, dressed up as democratization.

I don't think this is the permanent state of things, but I'm not going to pretend the arc bends inevitably toward openness, either. The cloud era was supposed to democratize infrastructure, and what it actually produced was vast accumulations of capital into a handful of billionaire-controlled conglomerates. We're all still pining for the web we lost, the one that got enclosed by the _other_ attention economy, the demand-side one, the one that figured out how to monetize eyeballs and strip-mined the commons in the process.

So I hold the hope honestly but not naively: that the spirit of open source and the DIY ethos that built the internet will have its counterpunch here. The big corporate models are truly frontier _now_, but not forever. Hardware gets cheaper. Training techniques get more efficient. Community datasets get built with consent and transparency.

The version I want to believe in — and want to help build — is the one where the tools of attention-amplification are collectively owned. Transparent models, trained on community data by community resources, runnable on commodity hardware. Not because the conservation law stops applying, but because the _gains_ from better attention-tooling should flow to the people spending the attention, not to the platform extracting rent on every token.

We'll see. The substructure holds either way. But the superstructure, who benefits, who pays, who decides, that part is still being written. And that's the part worth paying attention to.
