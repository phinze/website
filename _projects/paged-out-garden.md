---
title: Go Get a Garden Server
role: Submitted to Paged Out! #9
url: https://github.com/phinze/paged-out-garden
order: 6
---

The companion page for a one-page article I've submitted for [Paged Out! #9](https://pagedout.institute/).
The article makes the case for keeping a garden server: a low-stakes machine where
you tend things, try things, and let things grow. This page is for everything
that didn't fit on the one printed page: URLs, related reading, and a few notes
on how it came together.

## The article

[Read the PDF](https://github.com/phinze/paged-out-garden/raw/main/article.pdf) · [Source on GitHub](https://github.com/phinze/paged-out-garden)

## Links from the article

If you're reading on paper, here are the URLs that appear in the piece:

- The [Netscape Composer](https://en.wikipedia.org/wiki/Netscape_Composer) Wikipedia page, on the HTML editor that used to ship right inside your browser.
- Hannah Robertson's lovely post, [Houseplant programming](https://hannahilea.com/blog/houseplant-programming/), the framing this whole thing is downstream of.
- [Miren](https://miren.dev), the deployment system I work on.

## Further reading

A few of the threads the article pulls on are already written up here. The garden
server idea itself comes from [a post I wrote at work](https://miren.dev/blog/garden-server)
about how having a place for things to live makes them way easier to build. The
plant survives when there's a place for it. The "this is generative, it feels like
play" feeling traces back to [idk, try it](/writing/idk-try-it), about Evan telling
me to just deploy something and me remembering what software development used to
feel like. And the move from quietly running things behind a VPN to actually putting
a machine on the open internet (selkie, my little seal in Helsinki) is the story I
told in [Moving Day](/writing/moving-day).

## On process

I've been leaning hard into long LLM sessions for thinking out loud, sketching
shape, drafting prose. Honestly, conversation is just how I tend to get thinking
done, so the chatbot modality has fallen right into a pocket for me. The hard
part is voice. The easier it is to keep going, the more the writing drifts toward
an LLM register, and you don't always notice when you're inside it.

For this piece I let the LLM take the first pass and we banged on it together
until I had something I thought was good. Then I handed it to my wife Gabrielle.
Her read made it obvious: it was a local maximum. Wrong shape, too many lists,
too many ideas, voice not quite mine.

So I threw the whole thing out. Opened a fresh markdown file and rewrote it from
scratch in human words, with all the memory of what we'd worked out but none of
the prose. Then back into an LLM session for tightening and a final LLM-ism
scrub. The mix that worked here: shape exploration with the LLM, first draft from
my hands, finish with both.

I don't think this is the answer. It's just one experiment in figuring out which
roles the model plays well and which it doesn't. Get the ratio wrong and it reads
competent but hollow.

## On the drawings

Honestly, I was just excited to be participating in a zine and wanted some of
that zine-feel in the piece itself. I decided shitty hand drawings was the
move, going for a photocopied look. Pen on paper (purple ink), scanned with
Scanner Pro on iOS, synced to iCloud, pulled into the repo over SSH from my
Mac. From there the LLM drove the rest. Cropping, threshold-processing to
drop the gray dot grid the scanner adds, placing them in the LaTeX with the
right wrap and sizing. Casualty of the threshold pass: the dot above the "i" in
the signoff didn't survive.

Same conversational mode here, just pointed at images instead of prose. Running
ImageMagick incantations, comparing crop options, reasoning about float behavior
in a column layout. The mechanical, verifiable side of LLM-assisted work is the
part I'm more confident about. The "what does this paragraph want to say" part
is the one I'm still figuring out.

Honest take though: this particular pipeline was not the most efficient. I spent
an inordinate amount of time yelling at the model to nudge things up, down,
left, right. A couple of times I almost popped out of the workflow to just place
things by hand. The upside of slogging through is that the workflow is captured
now, in code and context, ready to pull off the shelf next time. Not a home run
on this one, but I'm happy with how it turned out, slog and all.

