---
title: "It's Nice to Have a Personal Server"
slug:  personal-server
date:  2026-02-15
listed: true
---

<!--
DRAFT NOTES (2026-03-01)

Part of a loose "My Setup" series. This is the personal server / self-hosted
services post. Should reference "The Box in the Basement" post for hardware/
network context once that's published.

Status: significantly reworked from original "Migrating My Homelab from Nomad
to Miren" draft. The detailed migration content (Nitter WORKDIR debugging,
Terraform snippets, code blocks for each service) was cut. That material
could live as a dedicated Miren blog cross-post if wanted.

Open threads:
- Intro still has some overlap with box-in-the-basement (Tailscale, hardware,
  Craigslist story repeated). Once that post exists, this one can trim the
  "Why it's easy to not think about" section and just link over.
- Secret Miren promotion motive: show don't tell. The Miren stuff should land
  as "and here's how easy the server part can be" not as a pitch.
- De-LLM-ify pass still needed — did one round but could use another.
- "Consuming the internet on your own terms" is the thesis — make sure it
  stays front and center and doesn't get buried by setup details.
- Glance (dashboard) and Booklore (book library) are mentioned but not linked.
  Could add links or cut the specifics.
-->

I've been running a personal server for about four years now. A Proxmox box in my basement, a few VMs, Tailscale stitching it all together. It started as a tinkering project, but at this point I'd really miss it if it went away.

Mostly what it gives me is a way to consume the internet on my own terms.

### What's running

[Miniflux](https://miniflux.app/) has been my RSS reader since late 2023. I follow maybe a hundred feeds — blogs, newsletters, a handful of news sources — and there's no algorithm sorting them for me. I open it in the morning, read what's there, and close it. Turns out that's all I ever wanted from a news reader.

[Redlib](https://github.com/redlib-org/redlib) has been my Reddit frontend since 2022. Same content, but no ads, no tracking, no "because you visited r/whatever" recommendations. Just the subreddits I chose, in chronological order. I've been running it long enough that I've had to patch it myself a couple times when Reddit's API changes broke things.

There are others — [Nitter](https://github.com/zedeus/nitter) for Twitter, a dashboard, a book library — but the specific services matter less than what they have in common. The default internet is a feed that someone else curates to maximize the time you spend looking at it. These are all tools that get out of the way and let me decide what's worth my attention.

### Why it's easy to not think about

**Tailscale** is a big part of it. Every VM I boot starts on my tailnet, behind NAT, unreachable from the public internet. I don't have to think about firewalls or auth or whether someone's scanning my ports. If you're on my tailnet, you can reach the server. If you're not, it doesn't exist as far as the internet is concerned.

The other half is just **having a box in the basement**. Four years ago I found a Craigslist post for a decommissioned workstation: Xeon Platinum 8275, 24 cores, 192GB of RAM. Talked the seller down to $1,800 and met him in a police station parking lot to exchange cash for server hardware. Added a 2TB NVMe drive, installed Proxmox, and eventually moved it into a rackmount case. That's the whole fleet.

There are no monthly bills — no instance types to agonize over, no egress charges. (There's a power bill, which I'll admit I haven't tracked carefully — but between rooftop solar and a community solar subscription, the electricity is at least coming from green sources.) The machine is comically overpowered for what I'm doing, since it runs my main dev VM *and* the personal server with resources to spare, but that's sort of the point. You buy the hardware once and then you just stop worrying about it.

It means I always have a place to deploy things. Want to try a new self-hosted app? Spin it up, point a DNS record at it. Want to prototype something weird for a weekend? Same thing. It's like having a workbench in your garage — you don't think about whether you have one, it's just there when you need it.

### The server part used to be the hard part

For the last few years, the services themselves ran on a pretty standard HashiCorp stack: a single Nomad node (`hashi01`) with Traefik in front, all managed with Terraform. It worked, but there was a lot of ceremony. Want to add a service? Write 80 lines of HCL, configure Traefik labels, set up Nomad variables, hope the template rendering does what you think it does.

I work on [Miren](https://miren.dev), so it was past time to eat my own cooking. This past weekend I spun up a fresh VM, installed Miren, and migrated everything off Nomad in an afternoon. The services each went from a 60-80 line Nomad job down to a short TOML file and a Dockerfile, and sidecars like Postgres just become another service in the same app definition instead of a whole separate job with its own lifecycle.

What I didn't expect was how useful the migration would be for the product itself. Deploying real workloads — services I actually depend on every day — surfaced a bunch of issues I never would have hit running demos or synthetic tests. I filed a handful of bugs and feature requests over the course of the afternoon, and a few of them have already made it into the product.

My RSS reader, my Reddit and Twitter frontends — it's all running on Miren now. And the server is still just there when I need it.
