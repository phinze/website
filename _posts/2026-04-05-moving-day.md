---
title: "Moving Day"
slug:  moving-day
date:  2026-04-05
---

This blog has been on GitHub Pages for over a decade. Push to main, site updates, done. I never had to think about it, and that was the point.

I recently moved it to a little cloud server that I run myself. That was also simple. What wasn't simple was getting to the point where I was willing to do it.

## The dark forest

When I was in college, Facebook showed up as thefacebook, sophomore year or so. It seemed like it genuinely cared about connecting people, and the product was *fun*. Gmail was insanely fast and useful, and Google seemed like it truly wanted to give amazing things away for free, funded by ads that were actually relevant. "Don't be evil." The pitches seemed earnest, and the tech backed them up. It all felt so innocent, so optimistic.

I graduated into the open source world with the same energy. Open protocols, open standards, shared infrastructure. The internet was this beautiful thing that made it possible for anyone to build anything and put it in front of the world. I was a true believer, and I'd built my early career on that belief.

Then it all soured, from every direction, in what felt like a few years. Facebook discovered that outrage drives engagement and optimized for it. In a move that would be too on-the-nose if you wrote it in a novel, Google quietly dropped "Don't be evil." And in 2013, Snowden showed us what had been hiding underneath all of it: the open protocols I loved were being tapped, the networks I'd trusted were instrumented for mass surveillance.

What really hurt: the openness was the attack surface. Our idealism left us open for exploitation.

That messed me up. You can't unsee it, and you can't go back to building on something the same way once you've seen the rot in the foundations.

Over time my politics radicalized. Not all at once. I kept believing in specific companies, specific founders, specific missions. And I kept getting my heart broken. The more time I spent in the industry, the more I saw how it worked from the inside. Good people can try to build good things. But company values and mission statements, when tested against profits, almost never hold up. They dilute, become just air. There's a gravity that pulls every company the same direction: exude enough honesty to attract talent, exploit it, generate returns, cut bait when things get too complicated. The system makes it almost impossible for things to stay good once the ideals of the people come into conflict with the ideals of capital, and the deeper you get into it the more it taints you.

And the same profit-maximization dynamics made the social web meaner. Engagement meant outrage, outrage meant attention, attention meant revenue. The pile-on became a genre. I watched people say something clumsy or half-formed and get absolutely shredded for it, and I learned the lesson everyone was supposed to learn: be careful. Think twice before you post. Maybe just don't. The risk/reward math on sharing your thoughts in public started to look pretty bad.

There's a selection bias when the public web gets this hostile. The voices that punch through tend to belong to people whose desire to be seen outstrips their risk calculus, or people who thrive on conflict. You look at who's still talking and it doesn't exactly inspire you to join in. And then the reasons stack up: anything I put out there is either an ego trip, or it gets torn apart, or it gets hoovered up by a corporation for profit. With all three of those on the table, of course you don't want to say anything. The reasons not to are so varied and so well-founded that silence starts to feel like the only rational choice.

You can see it in this blog's own history. In 2013 and 2014 I wrote earnest little "share what I've learned" posts, including a poetry-adjacent love letter to git commits. Then silence. Six years of it. I came back in 2020 because I got leukemia and that felt important enough to write about. Then mostly quiet again.

There's a name for this that's been kicked around a lot lately. Yancey Strickler called it the [dark forest theory of the internet](https://www.ystrickler.com/the-dark-forest-theory-of-the-internet/), borrowing from [Liu Cixin's sci-fi](https://en.wikipedia.org/wiki/The_Dark_Forest): the forest is dark, and you stay quiet because the predators are listening. People retreat to newsletters, group chats, private accounts. The public web is for the brave or the reckless.

I was in the dark forest for a long time, in both senses. Technically: don't run a server on the internet and you don't have to worry about defending it. Socially: don't put your thoughts in public and nobody can pick them apart. Both impulses pointed the same direction: stay behind the wall. And I did, for a long time. It's safe in there. It's also kind of lonely.

## Stepping out

I've been writing more lately. Between the dark forest and my own self-doubt, I'd internalized that wanting attention is vanity. I believed that for a long time. I realized I wasn't craving an audience, I was craving connection, and you can't find community if you're hiding.

Once I started writing again, I wanted stats. I used to think analytics were only good for number-go-up dopamine, but they're also about figuring out what resonates, who's referring people your way, who you should get to know. And I wanted those analytics to be mine, not Google's or Microsoft's, which meant self-hosting, which meant a server on the open internet.

I work on [Miren](https://miren.dev), a deployment platform. I'd been running it on my homelab for a while, all behind Tailscale, all invisible. At some point the contradiction got hard to ignore: I'm building a tool for putting things on the internet, and I won't put things on the internet. It was time to admit that a little VPS running a blog is not a high-value target. The bots will knock on port 22 and move on.

And there was a practical reason too: using Miren on the open internet is different from using it on a homelab behind a VPN. The tech industry calls this "dogfooding," which never quite captures the right feeling. It's more like being a baker who eats their own cake. You get to improve your recipes for the customers tomorrow, and you get to eat cake. ...yum.

So I rented a small server from [Hetzner](https://www.hetzner.com/cloud/) in Helsinki for three euros a month. I name my servers after cryptids, and this one is [selkie](https://en.wikipedia.org/wiki/Selkie), a shape-shifting seal from Scottish folklore. Felt right for a small creature bobbing along on the open sea.

The setup was easy. I would know, I helped make it that way. It also broke in a few interesting ways (I also helped make it that way, lol). More vanilla in the frosting next batch. I also decided to move the URL from `phinze.com` to [`inze.ph`](https://inze.ph), something a little weirder and more playful. Old links still work, cuz [cool URIs don't change](https://www.w3.org/Provider/Style/URI).

This site comes from a place now. Heavily virtualized though it may be, it's a computer in Helsinki. It has a name. Its IPv4 address is `204.168.143.238`. You are communicating with it right now.

Despite my only-somewhat-rational fears, ole selkie (young selkie, really) has not been hacked or DDoSed yet. It has plenty of headroom. There's room for more.
