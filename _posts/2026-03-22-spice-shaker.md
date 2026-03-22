---
title: "The Spice Shaker"
slug:  spice-shaker
date:  2026-03-22
listed: false
---

*This is an early draft I'm sharing for feedback. Please don't share widely, and hit me with your thoughts! [Last updated](https://github.com/phinze/phinze.github.io/commits/main/_posts/2026-03-22-spice-shaker.md): 2026-03-22 ~10am CT.*

*This is the second of two posts. The first, [The Economy of Attention](/writing/economy-of-attention), builds the frame: software is accumulated attention, AI made generating it cheap but understanding it is as expensive as ever, and the conservation law holds at every level. Here I pick up that frame and point it at what's being sold.*

## The Spice Shaker

There's a pitch being made that solves all of these problems at once. The frontier model companies, the LinkedIn-consultant-CEO-AI-booster class, a thousand breathless threads, all selling the same dream: the LLMs have ingested a hyperdimensional superset of all the attention ever paid into their massive training corpora. All that accumulated human comprehension, distilled into an API. Shake the shaker, get the flavor. Pay by the token for the privilege.

And in a way, from a certain angle, they kinda do? LLMs really have encoded patterns from an enormous volume of human thought. The model really can produce things that look like the output of comprehension. The spice shaker really does taste like something.

But what comes out is _diffuse_ attention, not _directed_ attention. The model has seen a million solutions to problems that look vaguely like yours. It hasn't verified that any of them actually work in your specific context. A good software product says "we understood this problem and here's the solution." The spice shaker says "this looks like what solutions to problems like yours usually look like." The flavor without the nutrition.

(Sure, the AI-heads will say: fine, we'll train more directed models, let a thousand flowers bloom. Maybe! But each of those flowers will need its own directed attention to cultivate. The conservation law doesn't care how many models you train.)

Marx would call the broader pitch [commodity fetishism](https://en.wikipedia.org/wiki/Commodity_fetishism): mistaking the product for the labor that produced it. The pitch collapses the distinction between "pattern-matched against a corpus of human comprehension" and "comprehended." Those are not the same thing. One is a product. The other is a process. The product can be bought and sold. The process has to be lived through.

## The SaaSpocalypse

The logical extreme of this pitch is the "SaaSpocalypse," the market-level panic that every SaaS product is just one `.md` file away from being replaced by a Claude skill. Nearly a trillion dollars in software market cap wiped out on the premise that all the accumulated attention baked into these products can be reproduced by shaking the shaker hard enough.

There's a site called [Death by Clawd](https://deathbyclawd.com/) that's savage, funny, and — intentionally or not — a perfect satire of the hysteria. You feed it a company URL and it generates a fake death certificate, a replacement SKILL.md file, and a eulogy. Replacement cost: ~$0.003 per run. Cause of death: "Claude learned to do it better than your silly little web app."

I ran it on [Miren](https://deathbyclawd.com?url=miren.dev), the infrastructure platform I work on. It gave us a 38/100 survival score, a eulogy that begins "Dearly beloved, we gather here to remember Miren — a platform that dared to ask, 'What if Heroku, but again, but this time we call it modern?'" and a 31-line SKILL.md that generates Dockerfiles and Terraform configs.

It's hilarious. It's also commodity fetishism in action. What the 31-line file can't reproduce is two years of accumulated attention from people who care about making deployment feel like a non-event. The design choices that make CI auth work without storing secrets. The UX decisions about what a developer should be thinking about (their app) versus what they shouldn't (load balancer configs). That's craft: human experience and taste, exported so others can benefit. The SKILL.md can generate configs. It can't generate taste. It took years of experience and years of attention to know what to build. (Or I'm wrong and we're killed in a year by a chatbot. Only time will tell!)

The taxonomy of survivors and casualties is telling, too. The companies that score well are the ones where the accumulated attention is _deeply embedded_: physical infrastructure, regulatory knowledge, things you can't pattern-match your way through. The ones sweating are workflow abstractions where the attention was always thinner, always closer to the shape that an LLM can reproduce.

And look — the Marxist in me has to say it — some of that sweating is _deserved_. Not all information asymmetry is the same. If your hard-won knowledge never made it into the training corpus — because it's proprietary, because it's too arcane, because it lives in the heads of people who learned it the hard way — the spice shaker can't reproduce it. But if your business model was milking a fat margin off the _shallow_ kind — well, information wants to be free, and it just got a lot freer. If the "value" you provided was mostly gatekeeping knowledge that's now freely accessible, then the conservation law is telling you something you maybe didn't want to hear: you never had that much accumulated attention in the first place. Your moat was opacity, not depth. The spice shaker _can_ reproduce thin attention. That's not a bug in the model. That's the forces of production disrupting the relations of production. That's how it's supposed to work.

If LLMs democratize knowledge and capability, if they make it so a solo developer or a tiny team can do things that used to require an enterprise sales call, I'm all for it. That's [the world I'm helping build toward at work](https://miren.dev) anyway. Shake that shaker. Disrupt away.

## Amplifier or Replacement

If AI helps you _skip_ attention, if nobody actually understands the thing that shipped, the product degrades. Buggy, confusing, unreliable software doesn't save user attention. It _costs_ user attention. The multiplier inverts. You've produced something that consumes more attention than it saves, and at that point it's not really technology in any real sense. It's just generated stuff that someone downstream has to deal with.

But if AI helps you spend attention more _effectively_, automating the mechanical work so you can focus your comprehension on the parts that matter, the multiplier improves. More attention-saving delivered to users per unit of attention spent building. That's good. That's technology doing what technology is supposed to do.

The distinction isn't whether AI was involved. It's whether the humans in the loop spent enough attention to ensure the output is understood, not just functional. The socially necessary attention, in Marx's framing, for the thing to have real use-value.

## Who Owns the Means of Attention

The big question isn't whether the conservation law holds. It's who controls the infrastructure that attention flows through.

Right now, the frontier models are controlled by a handful of companies, and the per-token pricing model is — if we're being honest about it — a new form of rent extraction. The entire corpus of human attention, scraped and compressed, sold back to us at metered rates. The landlord changed, but the structure is familiar. Marx would recognize this one too: enclosure of the commons, dressed up as democratization.

I don't think this is the permanent state of things, but I'm not going to pretend the arc bends inevitably toward openness, either. The cloud era was supposed to democratize infrastructure, and what it actually produced was vast accumulations of capital into a handful of billionaire-controlled conglomerates. We're all still pining for the web we lost, the one that got enclosed by the _other_ attention economy, the demand-side one, the one that figured out how to monetize eyeballs and strip-mined the commons in the process.

So I hold the hope honestly but not naively: that the spirit of open source and the DIY ethos that built the internet will have its counterpunch here. The big corporate models are truly frontier _now_, but not forever. Hardware gets cheaper. Training techniques get more efficient. Community datasets get built with consent and transparency.

The version I want to believe in — and want to help build — is the one where the tools of attention-amplification are collectively owned. Transparent models, trained on community data by community resources, runnable on commodity hardware. Not because the conservation law stops applying, but because the _gains_ from better attention-tooling should flow to the people spending the attention, not to the platform extracting rent on every token.

We'll see. The substructure holds either way. But the superstructure, who benefits, who pays, who decides, that part is still being written. And that's the part worth paying attention to.
