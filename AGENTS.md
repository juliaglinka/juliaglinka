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
