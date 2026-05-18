---
title: "Moving Day"
slug:  moving-day
date:  2026-04-05
---

Y'know that venerable and also sort of banal tradition of blog housekeeping posts? This started as one of those. "Hey so I moved off GitHub Pages here's a few technical details." I keep trying to write more straightforward technical posts and they keep morphing into thinky personal essays. At some point I'll shut up and just, like, map my homelab or whatever. But in the meantime...

## The dark forest

I remember college as a time of sustained techno-optimism. Google released Gmail during my freshman year, a gig of storage when everyone else gave you ten megs, and you could see "don't be evil" on the wall and not laugh. Our school got "thefacebook" around my sophomore year, and it seemed like it was built by folks who cared about the connecting-people part. The pitches were earnest and the tech backed them up, which is a combination you don't see much anymore and which I think we've collectively kind of forgotten was ever on the table.

Or so it felt to me at the time. I honestly can't sort out how much of that feeling was in the zeitgeist and how much was the optimism of a kid coming out of adolescence with a knack for computers, into a world where it felt like that knack was right in the pocket with the tilt of the world.

I graduated into the professional world and glommed onto the open source bandwagon. After watching the main characters of the tech world ship world-altering products for free, here was an ideology that gave the same energy a moral framework to live inside. [Information wants to be free](https://en.wikipedia.org/wiki/Information_wants_to_be_free). [Give it away, now](https://en.wikipedia.org/wiki/Give_It_Away_%28Red_Hot_Chili_Peppers_song%29). I wasn't politically mature enough to recognize the difference between these radical ideas and the underlying power structures they were agitating against. The good vibes felt contiguous. It was all roughly, "build cool shit. share it. try and make some honest money along the way."

The first crack was Snowden. In 2013 he showed us that the open infrastructure I'd been celebrating, the protocols and the friendly free email and the federated everything, was tapped at every layer, with the cooperation of the same companies whose pitches I'd been buying. The openness was the attack surface. The thing I'd been believing in was the thing that made it possible.

That really messed me up. Snowden didn't reveal one bad program or another, he revealed a posture, and I couldn't draw a clean line around the bad guys. There was no narrative I could construct about nasty spooks bullying good techies that rang true. The complicity was everywhere in the system. You can't unsee something like that, and afterward you can't bring the same trust to anything you're building on top of. The earnestness I'd been bringing to the work didn't have a clean place to land anymore.

Over the years that followed, the big guys kept proving the point. Facebook figured out somewhere along the way that outrage keeps people scrolling and built the platform around that fact, and the connecting-people promise started reading less like a mission and more like a cover story for the engagement machine. Google literally dropped "Don't be evil."

My politics radicalized, but slowly. For a long time I kept the frame I'd been raised on, kept believing in specific companies, specific founders, specific missions. And I kept getting my heart broken. Eventually you have to admit a pattern isn't bad luck.

The trouble wasn't that I'd picked the wrong heroes. The good guys never really switched sides because they were never actually on a side. It was always a battle between idealism and capital, with idealism doing all the talking and capital doing all the winning. The values printed on the lobby wall were recruiting material first, and the people printing them weren't lying exactly, they just didn't have any leverage against the shareholders when it counted. And the deeper I got into it, the more I felt the system shaping me too.

The same dynamic was reshaping how we talked online. The mood got meaner, and the pile-on became a genre. Somebody would say something clumsy or half-formed, and within hours there'd be a thousand quote-tweets pulling out the worst possible reading and dunking on it for sport. I watched enough of these to learn the lesson everyone was supposed to learn: the public web wasn't a place to be unfinished in. The risk/reward math on putting your thoughts out got bad enough that the answer started defaulting to "just don't."

And there's a selection bias once the public web gets this hostile. The voices that punch through the noise tend to belong to people whose desire to be seen outstrips their risk calculus, and the people who just genuinely enjoy a fight. You look at who's still talking and it doesn't exactly inspire you to wade in. Add to that the dawning sense that whatever you put out there is going to come across as an ego trip if it lands, get torn apart by strangers if it doesn't, and either way feed some corporate dataset on the way through. Silence starts to feel pretty defensible.

You can see it in this blog's own history. In 2013 and 2014 I wrote earnest little "share what I've learned" posts, including a poetry-adjacent love letter to git commits. Then silence. Six years of it. I came back in 2020 because I got leukemia and that felt important enough to write about. Then mostly quiet again.

I recently came across a nice metaphor that ties together this whole arc. Yancey Strickler called it the [dark forest theory of the internet](https://www.ystrickler.com/the-dark-forest-theory-of-the-internet/), borrowing from [Liu Cixin's sci-fi](https://en.wikipedia.org/wiki/The_Dark_Forest): the forest is dark, and you stay quiet because the predators are listening. People retreat to newsletters, group chats, private accounts. What's left on the public web is mostly the folks willing to take the hits.

## Stepping out

I've been writing more lately. Between the dark forest and my own self-doubt, I'd internalized that wanting attention is vanity. I believed that for a long time. What I missed by buying that frame wasn't really the audience. It was that publishing makes you commit to a snapshot of your thinking, and skipping it meant I never quite had to. And more importantly, publishing is like leaving little flags waving in the wind, signals that someone scanning a similar horizon might notice and walk over to.

I work on [Miren](https://miren.dev), a deployment platform. I'd been running it on my homelab for a while, all behind Tailscale, all invisible. That "no servers on the open web" reflex was a holdover from earlier years of running production infrastructure for a living, when the last thing I wanted off-hours was more of the same. The reflex outlasted the conditions that created it, by years. At some point the contradiction got hard to ignore: I'm building a tool for putting things on the internet, and I won't put things on the internet. It was time to admit that a little VPS running a blog is not a high-value target. The bots will knock on port 22 and move on.

And there was a practical reason too: using Miren on the open internet is different from using it on a homelab behind a VPN. The tech industry calls this "dogfooding," which never quite captures the right feeling. It's more like being a baker who eats their own cake. You get to improve your recipes for the customers tomorrow, and you get to eat cake. ...yum.

So I rented a small server from [Hetzner](https://www.hetzner.com/cloud/) in Helsinki for three euros a month. I name my servers after cryptids, and this one is [selkie](https://en.wikipedia.org/wiki/Selkie), a shape-shifting seal from Scottish folklore. Felt right for a small creature bobbing along on the open sea.

The setup was easy. I would know, I helped make it that way. It also broke in a few interesting ways (I also helped make it that way, lol). More vanilla in the frosting next batch. I also decided to move the URL from `phinze.com` to [`inze.ph`](https://inze.ph), something a little weirder and more playful. Old links still work, cuz [cool URIs don't change](https://www.w3.org/Provider/Style/URI).

This site comes from a place now. Heavily virtualized though it may be, it's a computer in Helsinki. It has a name. Its IPv4 address is `204.168.143.238`. You are communicating with it right now.

Despite my only-somewhat-rational fears, ole selkie (young selkie, really) has not been hacked or DDoSed yet. It has plenty of headroom. There's room for more.
