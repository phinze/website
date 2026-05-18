---
title: Go Get a Garden Server
role: Submitted to Paged Out! #9
url: https://github.com/phinze/paged-out-garden
order: 6
---

The companion page for a one-page article I've submitted for [Paged Out! #9](https://pagedout.institute/).
The piece makes the case for keeping a *garden server*: a low-stakes machine
where you can plant a few things and see what survives. This page is everything
that didn't fit.

## The article

[Read the PDF](https://github.com/phinze/paged-out-garden/raw/main/article.pdf) · [Source on GitHub](https://github.com/phinze/paged-out-garden)

## Links from the article

If you're reading on paper, here are the URLs from the piece:

- The [Netscape Composer](https://en.wikipedia.org/wiki/Netscape_Composer) Wikipedia page, on the HTML editor that used to ship right inside your browser.
- Hannah Robertson's lovely post, [Houseplant programming](https://hannahilea.com/blog/houseplant-programming/), the framing this whole thing is downstream of.
- [Miren](https://miren.dev), the deployment system I work on.

## Further reading

A few of the threads the article pulls on are already written up here. The
*garden server* idea itself came from [a post I wrote at work](https://miren.dev/blog/garden-server)
about how having a place for things to live makes them way easier to build.
[idk, try it](/writing/idk-try-it) covers the groove you can fall into when
iteration is cheap and the tooling stays out of the way. And the move from
quietly running things behind a VPN to putting a machine on the open internet
is the story I told in [Moving Day](/writing/moving-day).

## On process

I've been leaning hard into long LLM sessions to do my thinking. Conversation
is just how I figure things out, so the chatbot modality has fallen right into
a pocket for me. The hard part is voice. The easier it is to keep going, the
more the writing drifts toward an LLM register, and you don't always notice
when you're inside it.

For this piece I let the LLM take the first pass and we iterated until I had
a draft I was proud of. Then I handed it to my wife Gabrielle. Her response
was, basically, no. *Local maximum.* Too many lists, too many ideas, voice
not quite mine.

So I threw the whole thing out. Whole thing, gone. Opened a fresh markdown
file with all the memory of what we'd worked out and exactly none of the
prose, and rewrote in actual human words. Then I let the LLM back in for
tightening, and one more pass to scrub the LLM-isms it had snuck back in.

The hand-typed first draft was the unlock. Get the ratio wrong and the prose
comes out competent but hollow.

## On the drawings

I was excited to be in a zine and wanted some of that zine-feel in the piece
itself, so shitty hand drawings was the move. Purple pen on paper, scanned
through Scanner Pro on iOS, pulled into the repo over SSH from my Mac. From
there the LLM drove the rest, cropping and threshold-processing to drop the
gray dot grid the scanner adds, then placing them into the LaTeX. The
threshold pass killed the dot above the "i" in the signoff. Took the L on
that one.

Aiming the LLM at images is a different problem from aiming it at prose.
ImageMagick incantations, crop comparisons, float behavior in a column
layout. I trust it more on the mechanical stuff than I do on "what does this
paragraph want to say."

This particular pipeline was not, I will admit, the most efficient. I spent a
truly impressive amount of time yelling at the model to nudge things up, down,
left, right. A couple of times I almost popped out of the workflow to just
place things by hand like a normal human. The upside of the slog is the
workflow is captured now in code, ready for the next time I need to drop a
dot grid out of scanned purple-pen drawings and slot them into a two-column
LaTeX zine layout. Should come up any minute now.
