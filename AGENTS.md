# AGENTS.md

This file provides guidance to AI coding assistants when working with code in this repository.

## Project Overview

This is a personal website built with Jekyll 4.2.2 and hosted on GitHub Pages. The site features blog posts, talks, and projects with a custom theme based on Tufte CSS typography principles.

## Development Workflow

All development is done via Docker to avoid polluting the host machine. The site uses Docker Compose with named volumes for improved performance on macOS.

### Common Commands

- **Start development server**: `make serve` (starts Jekyll server on http://localhost:4000)
- **Open browser**: `make open` (opens http://localhost:4000)
- **Run arbitrary Jekyll command**: `make run CMD="jekyll <command>"`
- **View all make targets**: `make help`

### Docker Architecture

The `docker-compose.yml` uses:
- Jekyll 4.2.2 Docker image
- Named volumes for `jekyll_gems` and `jekyll_site` (not synced to host for performance)
- Only the project root is mounted to `/srv/jekyll`
- Port 4000 is mapped directly (not randomized)

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

Two custom Liquid tags are available (based on tufte-jekyll):

- `{% marginnote 'id' 'content' %}`: Creates a clickable margin note with toggle
- `{% sidenote 'id' 'content' %}`: Creates a numbered sidenote with toggle

Both are implemented as Ruby plugins in `_plugins/` directory.

### Theme and Typography

The site uses a custom theme inspired by Edward Tufte's typographic principles (tufte.css). The theme emphasizes:
- Clean, readable typography
- Margin notes and sidenotes for supplementary content
- Minimal, distraction-free design

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
listed: true  # Controls visibility in writing index
---
```

### Talk Front Matter
```yaml
---
title: "Talk Title"
date: YYYY-MM-DD
header:
  teaser: "https://url-to-image.jpg"
---
```

## Deployment

This is a GitHub Pages site. Pushing to the `main` branch triggers automatic deployment. The live site is at https://phinze.com (configured via CNAME).
