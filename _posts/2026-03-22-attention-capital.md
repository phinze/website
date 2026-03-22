---
title: "Who Owns the Attention Capital"
slug:  attention-capital
date:  2026-03-22
listed: false
---

*This is an early draft I'm sharing for feedback. Hit me with your thoughts! [Last updated](https://github.com/phinze/phinze.github.io/commits/main/_posts/2026-03-22-attention-capital.md): 2026-03-22 ~3:45pm CT.*

In [the last post](/writing/economy-of-attention) we built a frame: software is accumulated attention. LLMs have given us incredible new tools for manipulating text and code, but they cannot substitute the attention required to construct and maintain a working system. You can chase the attention around, but you can't skip it.

The AI industry would beg to differ. Their product is a glorious ur-solution to all these problems. And the new problems created by the solution? AI solves those too!

## The Spice Shaker

The pitch, as delivered by frontier model companies, the LinkedIn-consultant-CEO-AI-booster class, and a thousand breathless threads, goes something like this: the LLMs have ingested a hyperdimensional superset of all the attention ever paid into their massive training corpora. Accumulated human comprehension has been distilled into an API. It's done, folks. We did it. No more thinking required. Shake the shaker, get the flavor. Pay by the token for the privilege.

Okay but jokes aside, I'm not here to dismiss the whole thing. LLMs really have encoded patterns from an enormous volume of human thought. The model really can produce things that look like the output of comprehension, and that output can have truly immense value! The spice shaker really does taste like something.

But the value of what comes out depends entirely on the attention going in. The pitch is that LLMs are a _replacement_ for human attention. My claim is that they're an _amplifier_.

Good technology replaces comprehension all the time! Millions of people ride the bus without understanding combustion engines. I've been writing code for twenty years and I can count on one hand the number of times I've had to think about CPU registers (either school, or very very bad times). That's what a strong abstraction does: it lets you build on top of something without understanding its internals. And LLMs genuinely do this for a lot of use cases. Non-technical people are getting real value from them right now, no comprehension of transformers required. The abstraction holds.

The abstraction leaks when you need to _change, debug, or extend_ the system. The bus rider doesn't need to understand the engine. The mechanic does. And if you replace all the mechanics with people who also just ride the bus, your fleet works great until the first breakdown. The AI industry is claiming they've built a non-leaky abstraction over human comprehension. The conservation law says that's not possible above a certain complexity threshold. For simple stuff, the abstraction holds fine. For complex systems that other people depend on, it leaks, and when it leaks, someone has to have the comprehension to deal with it.

So where LLMs help you spend attention more _effectively_, automating the mechanical work so you can focus your comprehension on the parts that matter, the multiplier improves. That's good. That's technology doing what technology is supposed to do. But where they help you _skip_ attention entirely, the output degrades. The flavor without the nutrition. Someone downstream has to pay the attention debt.

(Sure, the AI-heads will say: fine, we'll train more directed models, let a thousand large-language-flowers bloom. Maybe! But each of those flowers will need its own directed attention to cultivate. The conservation law doesn't care how many models you train.)

Marx would call the broader pitch [commodity fetishism](https://en.wikipedia.org/wiki/Commodity_fetishism): treating a product as if its value is inherent, forgetting the labor that produced it. The frontier model companies stand atop a massive accumulation of other people's attention — the entire written output of humanity, more or less — and say ["I made this."](https://nedroidcomics.tumblr.com/post/41879001445/the-internet) The model is presented as their innovation, their product, their capital. But the value in it is the comprehension-labor of millions of people who never agreed to the deal.

## The SaaSpocalypse

The logical extreme of this pitch is the "SaaSpocalypse," the market-level panic that every SaaS product is just one `.md` file away from being replaced by a Claude skill. Nearly a trillion dollars in software market cap wiped out on the premise that all the accumulated attention baked into these products can be reproduced by shaking the shaker hard enough.

There's a site called [Death by Clawd](https://deathbyclawd.com/) that's savage, funny, and — intentionally or not — a perfect satire of the hysteria. You feed it a company URL and it generates a fake death certificate, a replacement SKILL.md file, and a eulogy. Replacement cost: ~$0.003 per run. Cause of death: "Claude learned to do it better than your silly little web app."

I ran it on [Miren](https://deathbyclawd.com?url=miren.dev), the infrastructure platform I work on. It gave us a eulogy that begins "Dearly beloved, we gather here to remember Miren — a platform that dared to ask, 'What if Heroku, but again, but this time we call it modern?'" and a 31-line SKILL.md that generates Dockerfiles and Terraform configs.

I laughed, I cried, I laughed again. I ran it on my friends' companies. This thing is _merciless_!

Gauche as it is to defend my workplace against a takedown from a chatbot, there _is_ a difference between the markdown file and the thing I help build every day. We think human experience and taste and sustained attention to a problem will produce something with way more value than you'll get out of a Claude skill. The SKILL.md can generate configs. It can't generate taste. (Or I'm wrong and we're killed in a year by a chatbot. Only time will tell!)

And look — the Marxist in me has to say it — some of this SaaS sweating is _deserved_. There _is_ a class of business whose fat margins depended on knowledge being scarce, not on understanding being deep. Information wants to be free, and it just got a lot freer. The spice shaker _can_ reproduce thin attention. That's the forces of production disrupting the relations of production. Please enjoy the capitalism you ordered, dear sirs.

If LLMs _can_ democratize knowledge and capability, if they make it so a solo developer or a tiny team can do things that used to require an enterprise sales call, I'm all for it. That's [the world I'm helping build toward at work](https://miren.dev) anyway. Shake that shaker.

## Who Owns the Attention Capital

The frontier models are the largest accumulation of attention capital in history: the entire corpus of human comprehension, scraped and compressed into a handful of proprietary systems. And the per-token pricing model is — if we're being honest about it — rent extraction on that capital. Metered access to distilled human thought, sold back to the people who produced it. Oh good, a new class of landlords. Marx would recognize this one: enclosure of the commons, dressed up as democratization.

I don't think this is the permanent state of things, but I'm not going to pretend the arc bends inevitably toward openness, either. The cloud era was supposed to democratize infrastructure, and what it actually produced was vast accumulations of capital into a handful of billionaire-controlled conglomerates. We're all still pining for the web we lost, the one that got enclosed by the _other_ attention economy, the demand-side one, the one that figured out how to monetize eyeballs and strip-mined the commons in the process.

So I hold the hope honestly but not naively: that the spirit of open source and the DIY ethos that built the internet will have its counterpunch here. The big corporate models are truly frontier _now_, but not forever. I'll be honest that I haven't done enough homework on the open-source model world to know exactly what the alternative looks like yet. Right now just understanding what the corpo-frontier tools can do is taking up enough of my brain.

But my dream is we can get to something shaped like: tools of attention-amplification that are collectively owned. Transparent models, trained on community data by community resources, runnable on commodity hardware. Not because the conservation law stops applying, but because the _gains_ from better attention-tooling should flow to the people spending the attention, not to the platform extracting rent on every token. I'd like to learn more about the people building toward that, and I'd like to help where I can.

We'll see. The substructure holds either way. But the superstructure, who benefits, who pays, who decides, that part is still being written. And that's the part worth — well, you know.
