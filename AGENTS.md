# AGENTS.md

Instructions for AI agents working on this project.

## Project Overview

Professional photography portfolio website for "Julia Glinka Fotografia" - a maternity photography business in Warsaw, Poland. Built with PureScript Halogen and Tailwind CSS.

## Tech Stack

- **Language**: PureScript 0.15.4
- **Framework**: Halogen (UI components)
- **Styling**: Tailwind CSS 3.4 (CDN)
- **Build**: Spago, esbuild
- **Testing**: purescript-spec
- **Formatting**: purs-tidy

## Commands

```bash
npm run build       # Build PureScript project
npm run test        # Run tests
npm run lint        # Check formatting
npm run format      # Auto-format code
npm run ci          # Run all CI checks (lint + build + test)
npm run serve       # Build and start dev server
npm run build:gh    # Build for GitHub Pages
```

## Top-Level Directories

- `src/` - PureScript source code
- `test/` - Test files
- `dev/` - Development files (HTML, CSS, images)
- `docs/` - GitHub Pages build output
- `.github/` - GitHub Actions workflows
- `.opencode/` - opencode LSP and skills config

## Git

- Pre-commit hooks run: lint, build, test
- All checks must pass before commit
- Main branches: `main`, `githubio`

### Publishing

**NEVER push to `githubio` branch unless the user explicitly says 'publish'.**

**IMPORTANT: `docs/CNAME` must NEVER be deleted.** This file contains the custom domain for GitHub Pages. Always preserve it during builds.

When user says 'publish':
1. Check for uncommitted changes. If there are any, inform the user and ask them to type 'ignore' to proceed anyway.
2. Ensure all changes are committed to `main`
3. Verify `docs/CNAME` exists and contains `juliaglinka.pl`
4. Fast-forward `githubio` to `main`:
   ```bash
   git checkout githubio
   git merge --ff-only main
   git push origin githubio
   git checkout main
   ```

GitHub Actions will automatically build and deploy to GitHub Pages.

## Code Architecture

### index.html

`dev/index.html` should ONLY contain:
- HTML boilerplate and `<head>` with SEO meta tags
- Script tag to load `bundle.js`
- JSON-LD structured data for SEO

**All application logic must be in PureScript.** Never add JavaScript to index.html.

### Testing Requirements

- All pure functions must be unit tested
- Extract business logic into pure functions for testability
- Tests go in `test/` mirroring `src/` structure
- Use `purescript-spec` framework
