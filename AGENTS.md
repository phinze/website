# AGENTS.md

This file provides guidance to AI coding assistants when working with code in this repository.

## Project Overview

This is a personal website built with Jekyll 4.2.2 and hosted on GitHub Pages. The site features blog posts, talks, and projects with a custom brutalist theme.

## Development Workflow

Development uses a Nix flake devShell (via direnv) to provide Ruby 3.3 and native dependencies. Bundler manages gem installation into a local `.gems/` directory.

### Prerequisites

- [Nix](https://nixos.org/) with flakes enabled
- [direnv](https://direnv.net/) (recommended, for automatic shell activation)

### Getting Started

1. `direnv allow` (or `nix develop` if not using direnv)
2. `make install` to install gem dependencies
3. `make serve` to start the development server at http://localhost:4000

### Common Commands

- **Install dependencies**: `make install`
- **Start development server**: `make serve` (starts Jekyll server on http://localhost:4000)
- **Build the site**: `make build`
- **Clean generated files**: `make clean`
- **Open browser**: `make open` (opens http://localhost:4000)
- **View all make targets**: `make help`

### Nix Architecture

The `flake.nix` provides a devShell with:
- Ruby 3.3 and Bundler
- Native libraries: libxml2, libxslt, libyaml, zlib, openssl
- macOS frameworks provided automatically by the Darwin stdenv SDK
- `GEM_HOME` set to `.gems/` (project-local, gitignored)
- `NOKOGIRI_USE_SYSTEM_LIBRARIES=1` for native nokogiri builds

The `.envrc` file activates the devShell automatically via direnv.

**Important**: When making changes to `_config.yml`, you must restart the Jekyll server (CTRL-C and re-run `make serve`) as Jekyll does not watch config file changes.

## Site Architecture

### Collections

The site uses three Jekyll collections defined in `_config.yml`:

1. **posts** (`_posts/`): Blog posts with `layout: post`, permalinks at `/writing/:slug`
   - Posts have a `listed: true/false` frontmatter flag to control visibility
   - Only posts with `listed: true` appear in the writing index

2. **talks** (`_talks/`): Conference talks and presentations with `layout: talk`, permalinks at `/speaking/:slug`
   - Include embedded slides via `{% include slides id="..." %}`
   - Include embedded videos via `{% include video id="..." provider="youtube" %}`

3. **projects** (`_projects/`): Personal projects with `layout: project`, permalinks at `/projects/:slug`

### Custom Plugins

Two custom Liquid tags are available:

- `{% marginnote 'id' 'content' %}`: Creates a clickable margin note with toggle
- `{% sidenote 'id' 'content' %}`: Creates a numbered sidenote with toggle

Both are implemented as Ruby plugins in `_plugins/` directory.

### Theme and Typography

The site uses a custom brutalist theme (`brutalist.css` + `site.css`) with:
- Public Sans for body text, Hack for monospace
- Clean, minimal design with purple accent color
- Margin notes and sidenotes for supplementary content

### Page Structure

- `/index.md`: Home page with introduction
- `/writing.md`: List of blog posts (filters by `listed: true`)
- `/speaking.md`: List of talks (reversed chronological)
- `/projects.md`: List of projects
- `_layouts/`: HTML templates (default, post, talk, list)
- `_includes/`: Reusable components (head, header, footer, slides, video)

## Content Formatting

### Post Front Matter
```yaml
---
title: "Post Title"
slug: short-slug
date: YYYY-MM-DD
---
```

Posts are listed by default. Only include `listed: false` to hide a post from the writing index.

### Talk Front Matter
```yaml
---
title: "Talk Title"
date: YYYY-MM-DD
header:
  teaser: "https://url-to-image.jpg"
---
```

## Writing Voice

When collaborating on blog posts, read existing posts to calibrate voice before drafting. The voice ranges from goofy/warm to essayistic — match the material. Key things:

- **H2-only** heading structure in posts (no h3s)
- **Em dashes**: budget consciously — LLMs overuse them. A handful per post, for genuine asides.
- **Be precise with theory**: when invoking a thinker (Marx, Deming, etc.), understand what's their concept vs. your riff on it
- **Transparent about process**: if AI was used in writing, be open about it

See the `write-post` skill for the full collaborative writing process.

## Deployment

This is a GitHub Pages site. Pushing to the `main` branch triggers automatic deployment. The live site is at https://phinze.com (configured via CNAME).
