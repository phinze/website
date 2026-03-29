---
title: "Build the Software, Use the Software"
slug:  build-use-loops
date:  2026-03-28
listed: false
---

*This is a draft — feedback welcome! Last updated 2026-03-29. [Edit history on GitHub.](https://github.com/phinze/phinze.github.io/commits/main/_posts/2026-03-28-build-use-loops.md)*

Every nerd wants a Jarvis. A personal AI that knows your stuff, handles your tasks, extends what you can do. The dream has been kicking around since long before the tech was anywhere close.

The tech is getting close. And I've been having a lot of fun exploring what it feels like to actually build toward this, one small tool at a time.

I keep coming back to a loop: build the software, use the software. Using it shows you what to build next. The loop tightens until building and using blur together into the same activity. No roadmap. No backlog. Just friction driving features, in real time, in the same session.

## What It Looks Like

I have a CLI called `pim` that handles my email, calendar, and docs from the terminal. It started as a way to do email triage in Claude Code sessions. Forty-some commands now, across Gmail, Fastmail, Google Calendar, Drive.

One session I was trying to export an email thread and noticed it only pulled 2 of the 6 messages. Mid-conversation:

> **me:** 2 messages hm there were 6 in that thread, but we might want to figure out if we have a bug in thread read
>
> **me:** do we have/need a 'read-thread' primitive to fetch the content you can see in a given gmail read view?
>
> **me:** yeah let's build it

Three minutes later, `read-thread` exists for both Gmail and Fastmail. We test it on the original thread — all 6 messages. I go back to writing my reply, which surfaces another gap (doc-import doesn't handle markdown well), and we build that too.

I wasn't planning to build `read-thread` that day. I was trying to reply to an email. The feature emerged because I was using the tool and it couldn't do what I needed. That's the loop.

## Radiohead Day

The music one is my favorite because it shows the whole arc.

It didn't start as a software project. It started as "help me pick some music." Just vibes in a Claude session — "something beepy boopy but not super high energy" — and Claude would suggest artists. That worked. Then: "can you spin it for me?" Well, now we need something that can control playback. "Can you inspect my library to make recommendations?" Now we need an API integration. "I also listen to DJ mixes on YouTube, can you recommend those?" "Can you play those for me?"

Each question pushed past what conversation alone could handle, and a tool got built at the boundary. That's how `yt-dj` happened — a menubar music player wrapping mpv and Apple Music, grown out of a series of "can you also..." moments.

One session I wanted to listen to Radiohead's whole discography backwards, newest to oldest:

> **me:** let's do a radiohead day, queue their whole discography backwards, so we'll listen to newest album first

Nine albums get queued. Then playback breaks. We dig into the daemon code, find two bugs — no playback state observer, queue entries not fully loading metadata. We design a verification loop that polls for metadata resolution instead of blind sleeping. Build it, restart the daemon, re-queue all nine albums.

Then:

> **me:** okay can you uh skip to the track we were on before
>
> **claude:** I'm not sure how far you got before it stopped — do you remember which track or roughly how far into A Moon Shaped Pool you were?
>
> **me:** "it's too late the damage is done" was the lyric
>
> **claude:** That's Decks Dark — track 3.

That's one continuous conversation. Queue the discography. Debug the player when it breaks. Redesign the queue system. "Now something higher energy for the afternoon." Skip to a song by quoting a lyric. Fix a bug. Find a mix. You can't separate the building from the using because they're not separate activities. It's all one thing — an assistant that's improving itself as you lean on it.

## The Feed Reader

I built a unified feed reader for Bluesky and Mastodon. Go backend, React frontend, SQLite cache. The first month of development is fifty-some Claude Code sessions, and the pattern is the same every time.

Deploy the feed reader. Start reading. Notice something:

> "I see repeats in the feed"

Fix it. Keep reading.

> "this context page doesn't load"

Fix it.

> "when I click back it doesn't remember my scroll position"

Fix it.

> "we show images but not videos, let's fix that"

Build video support. One day I see a Mastodon quote post that doesn't render right:

> "Masto seems to have a quote post format... can we render that?"

That conversation ends with us building an entire Go Mastodon client library. Another day, I'm reading an epic Bluesky thread and want to understand the full argument:

> "is there a way we can get a full dump of all the activity on it, get some stats, and wrap our head around the argument?"

That spawns the entire thread analysis feature. And a week later, on my phone:

> "i cant access the left hand menu on phone view, do we need to hamburgerize it?"

Every feature traces back to a moment of actually using the thing. I never sat down and wrote a roadmap. The roadmap was using the software.

## Houseplant Programming

Hannah Ilea has a lovely framing for this kind of work: [houseplant programming](https://hannahilea.com/blog/houseplant-programming/). Tiny software, just for yourself. It doesn't need to scale. It doesn't need to be production-ready. It just needs to be alive enough to be useful to you.

At work we've been running with a related idea — [the garden server](https://miren.dev/blog/garden-server). A little cluster where internal apps grow. Sixteen applications now, from meeting bots to design docs to emoji search. The key insight there was that having a place for things to live made it way easier to build them. The plant survives when there's a place for it.

My `-stuff` repos are the personal version of this. Each one is a pot on the windowsill. `pim-stuff`, `social-stuff`, `music-stuff`. They don't need to be polished. They don't need users. They just need to be useful to me, and they get better every time I use them.

## Every Nerd Wants a Jarvis

There's a lot of energy right now around the idea of a personal AI assistant. Projects like [OpenClaw](https://github.com/nichochar/openclaw) are going at it top-down — build the unified assistant, give it broad permissions, let it self-modify, add a community skill marketplace. Design Jarvis, then deploy him.

I'm going at it from the other end. No grand architecture. Just a growing collection of scoped tools, each one built in sessions where I'm sitting right there, each one earning trust by being useful. `pim-stuff` handles my email. `social-stuff` reads my feeds. `music-stuff` plays my music. None of them talk to each other yet. None of them run autonomously. They're individual houseplants, not a connected garden — not yet.

But they compound. The email commands make triage faster, which gives me more time to hack on the feed reader, which teaches me patterns I bring back to the email tool. Each tool makes the next one easier to build. And because I'm using them every day, the build/use loop keeps each one getting better.

I think both approaches will teach us things. Top-down will probably get to Jarvis-shaped faster. But I trust the bottom-up path because I can see every piece working. Trust earned, not granted.

## What Changed

I should be honest about what's doing the work here. I've been writing software for twenty years. I know when to reach for an API, how to evaluate a stack, when an architecture smells wrong. That knowledge matters — I'm not just throwing prompts at a wall.

But honestly? Most of the time I'm not doing architecture. Most of the time it's just "can you also do this now?" The expertise shows up as taste — knowing what to ask for, recognizing when something's going sideways, having a sense for what's structurally possible. It operates in the background. The foreground is just describing what I want to happen next and seeing if it works.

I'm building more personal software than I have in years. Ideas I'd been sitting on — a unified social feed, a hardware dashboard, a DJ concierge — are suddenly real. The activation energy dropped.

The thing that makes it work isn't the AI generating code. It's that the AI is *in the session with me* while I'm using the software. I hit a wall, I describe what I wanted to happen, and we fix it without switching contexts. The friction between "I wish this worked differently" and "now it does" got very small.

I don't know what shape this takes long-term. Maybe Jarvis, eventually, assembled from the bottom up. Maybe just a windowsill full of houseplants that I tend and use and enjoy. Either way, the loop is the thing I like most about it right now. Build it, use it, notice what's missing, build that too.
