---
title: "Moving Day"
slug:  moving-day
date:  2026-03-29
listed: false
---

This site has been on GitHub Pages for over a decade. Push to main, site updates, no moving parts. Hard to beat for a personal blog you don't want to think about.

I've been wanting to move it to my own server for a while. Self-hosted analytics that don't track my visitors. The ability to run other things alongside the blog. And I wanted to dogfood [Miren](https://miren.dev) — the deployment platform I work on — for personal stuff, not just at work.

For years I was too nervous to put anything on the open internet. I did enough of that professionally, and I didn't want the headache of worrying about package updates and wondering whether I need fail2ban. [Tailscale](https://tailscale.com/) was a godsend — I could run things from my basement, access them from anywhere, without exposing anything to the public web. It was my security blanket. But it also meant I couldn't host anything publicly.

Two things shifted. At Miren, we've been pulling on this idea that a Linux computer you control is a very powerful thing, and that good software can make any Linux box feel close at hand for putting applications on. And personally, I've been recalibrating my threat model — less perfection-chasing and fear, more experimentation and play.

So it was time to put a little server up on the internet. On a Saturday morning I decided to see how far I could get.

## Selkie

I name my servers after cryptids. This one wanted a name that fit a small buoy on the open sea — a little machine, out there, doing its thing. Selkie, the shape-shifting seal from Scottish folklore.

The box is a Hetzner Cloud CX23: 2 vCPUs, 4 GB RAM, 40 GB disk, €2.99/month. That's under Miren's minimum system requirements, but I figured a Jekyll blog wouldn't stress it. `--skip-system-check` and we're off.

## The IPv6 Surprise

First snag: after installing the Miren server, I couldn't connect to it from my laptop.

`miren cluster add` showed the cluster's address as `0.0.0.0:8443`. Digging into the logs, Miren's IP discovery had only found an IPv6 public address. The IPv4 — right there on `eth0` — was invisible.

Miren was calling `ifconfig.co` to discover its public IP, and Hetzner prefers IPv6 for outbound connections. So `ifconfig.co` returned an IPv6 address, and the reachability check ran single-stack too. The IPv4 never got recognized as public.

I'd been running Miren on home lab machines and cloud VMs where IPv4 was the default. Hetzner's dual-stack network broke an assumption nobody had questioned.

A couple hours reading the code, and I [had a fix](https://github.com/mirendev/runtime/pull/708): drop the `ifconfig.co` dependency entirely (local interface enumeration already finds all the IPs), and make the reachability check dual-stack — two concurrent calls, one forced over IPv4 and one over IPv6. A community member [showed up on the PR](https://github.com/mirendev/runtime/pull/708#issuecomment-4150643471) having hit the same issue on his own Hetzner box. Good timing.

`miren cluster add --address 204.168.143.238:8443` got me connected in the meantime.

## The Blog Goes Up

Jekyll on Miren needs a Dockerfile today — Miren's stack detection sees the Gemfile and thinks "Ruby web app," but Jekyll just generates static HTML. So: a multi-stage Dockerfile that builds the site with Jekyll and serves it with nginx. Plus a small `nginx.conf` for pretty URLs. Fifteen lines of config total.

```
miren init
miren deploy
```

Live on `blog.phinze.run.garden` in about two minutes, most of that pulling the Ruby base image.

This is temporary scaffolding. I want to [add first-class static site support](https://linear.miren.garden/MIR-854) to Miren — detect Jekyll (or Hugo, Eleventy, Astro, etc.) from the project files, build it, serve it with a tiny static file server. Zero config. Today it took a Dockerfile; soon it won't.

## Analytics

One of the main reasons I wanted my own server: analytics I feel good about.

[Umami](https://umami.is/) is an open-source, privacy-respecting analytics platform. No cookies, no tracking across sites, you own the data. It's a Next.js app backed by Postgres.

This was a good chance to try Miren's [addon system](https://miren.md/addons) — I added `[addons.miren-postgresql]` to the app config and Miren provisioned a Postgres instance and injected `DATABASE_URL` automatically. Umami ran its Prisma migrations on first boot and was ready to go. The whole `app.toml` is five lines.

`stats.phinze.run.garden` was up in under a minute. Add the tracking snippet, redeploy the blog, watch my own visit show up. Done.

## The DNS Cutover

Last step: pointing phinze.com from GitHub Pages to selkie.

I use DNSimple with Terraform, so it was a one-line change — swap the ALIAS record from `phinze.github.io` to Miren's cluster hostname. `terraform apply`, done.

Then: waiting. DNS propagation. Miren eagerly tries to provision a TLS certificate via Let's Encrypt as soon as you set a route, but the ACME challenge needs DNS to be pointing at the right place first. The eager attempt failed, and Miren started retrying in the background. Meanwhile, my first `curl` to `https://phinze.com` hung for four minutes on the TLS handshake — it was trying to get the cert inline and blocking until the ACME challenge timed out. That's a [papercut I filed](https://linear.miren.garden/MIR-926) — I'll fix it this week so it falls back to a self-signed cert after a few seconds instead of blocking.

Twenty minutes later, DNS had propagated. The ACME challenge succeeded. Let's Encrypt cert, TLS 1.3, phinze.com serving from selkie.

## The Box

After everything — Miren server, the blog, GoatCounter, VictoriaMetrics, VictoriaLogs, etcd, containerd, BuildKit — the CX23 is using about 1 GB of its 3.7 GB RAM and 4 GB of its 38 GB disk. CPU load: 0.02. Basically asleep.

I like having a little server with a name. It costs less than a coffee. I can SSH into it and poke around. Three bugs filed, two PRs shipped, a blog and an analytics dashboard running. Not bad for a Saturday.

Enjoy the deploy.
