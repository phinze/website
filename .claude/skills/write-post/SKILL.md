---
name: write-post
description: Collaborative blog post writing session for phinze.com
---

# Write a Blog Post

Collaborative writing session for phinze.com. Writing is iterative conversation, not "generate a draft."

## Process

The shape of a writing session varies, but generally moves through these phases (not necessarily in order, not all required):

1. **Explore the idea**: Discuss the concept, pull in source material (links, conversations, vibes). Build the conceptual skeleton through conversation before writing prose. Fetch and analyze linked posts to understand the landscape.

2. **Draft**: Write into `_drafts/` or `_posts/` (with `listed: false` for sharing before publishing). Structure emerges from the discussion, not from a template.

3. **Iterate**: Multiple editing passes with different lenses. Common passes include:
   - Structure: is the argument flowing? are sections in the right order?
   - Precision: are claims accurate? are we being honest about what we know and don't?
   - Voice: does this sound like a human with opinions? weave in moments of personality.
   - De-LLM: sweep for tells (see below)
   - Length: ruthless cuts — would the reader miss this paragraph if it were gone?

4. **Integrate feedback**: When sharing drafts, take feedback seriously. Make changes, then help draft responses to the people who gave feedback.

## De-LLM Awareness

LLM writing has tells. Know them, sweep for them, but don't over-correct — sometimes a "here's" is just a "here's."

Common tells to watch for:
- Em dash overuse (budget them consciously, a handful per post)
- "This is X" / "But here's X" setup-reveal sentence openers
- "genuinely," "incredibly," "fundamentally" — hedge words that add nothing
- Triplet lists where two items or one sentence would do
- Throat-clearing transitions ("The distinction matters, and it's more nuanced than it sounds")
- Tidy wrap-up closings that tie a bow on everything

## Voice

Read existing posts before drafting to calibrate register. The voice ranges:
- Goofy and warm (diagnosis posts, idk-try-it)
- Essayistic and idea-driven (level-of-detail, economy-of-attention)

Match the material. Don't force one register onto the other. Within any register:
- Personality over polish
- Honest over composed
- Short punchy beats earn the longer analytical paragraphs
- If invoking a theorist or framework, be precise — understand what's theirs vs what's yours

## Site Conventions

- H2-only heading structure (no h3s in posts)
- Frontmatter: title, slug, date, listed (true/false)
- Drafts can use `listed: false` in `_posts/` for shareable-but-unlisted
- Commit and push regularly during sessions for live preview
- When sharing unlisted drafts for feedback, add an italic prefix line with: a note requesting feedback, a last-updated timestamp, and a link to the file's commit history on GitHub (since the repo is public, this serves as "receipts" on the editing process)
