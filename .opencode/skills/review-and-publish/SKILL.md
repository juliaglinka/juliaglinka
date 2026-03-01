---
name: review-and-publish
description: Review code quality, run CI checks, and publish the project to GitHub Pages
---

# Review and Publish Skill

Review code quality, run checks, and publish the project.

## When to Use

Use this skill before building and publishing to ensure code quality.

## Code Conventions

### PureScript

- Use standard Prelude imports
- Export pure functions for testability
- Keep components small and focused
- Use descriptive action names in Halogen components
- Format with purs-tidy before committing
- Always add type signatures to top-level definitions

### Tailwind CSS

- Use standard Tailwind classes (no arbitrary values like `text-[11px]`)
- CDN doesn't support JIT arbitrary values
- Use `./images/` prefix for image paths
- Color palette: stone/neutral for elegant look

### Testing

- Place tests in `test/` mirroring `src/` structure
- Use `purescript-spec`
- Test pure logic, not UI rendering
- Name test modules `Test.<module.path>`
- Export pure navigation/transform functions for testing

## Common Patterns

### Halogen Component

```purescript
component :: forall q i o m. MonadEffect m => H.Component q i o m
component = H.mkComponent
  { initialState: \_ -> { ... }
  , render
  , eval: H.mkEval H.defaultEval { handleAction = handleAction }
  }

handleAction :: forall cs o m. MonadEffect m => Action -> H.HalogenM State Action cs o m Unit
handleAction = case _ of
  SomeAction -> H.modify_ \st -> st { ... }
```

### Event Handling with StopPropagation

When adding click handlers inside a parent with its own click handler:

```purescript
HH.button
  [ HE.onClick \_ -> SomeAction
  , HP.attr (HH.AttrName "onclick") "event.stopPropagation()"
  ]
```

### Navigation Functions (for testing)

Extract navigation logic into pure functions:

```purescript
nextImageIndex :: Int -> Int -> Int
nextImageIndex currentIdx len =
  if currentIdx >= len - 1 then 0 else currentIdx + 1
```

## Review Checklist

Before building/publishing, ensure:

1. **Formatting**: Run `npm run format` if needed
2. **Build**: `npm run build` succeeds without errors
3. **Tests**: `npm run test` passes all tests
4. **Lint**: `npm run lint` shows no issues

## Full CI Check

Run all checks at once:

```bash
npm run ci
```

This runs: lint → build → test

## Building for Production

For GitHub Pages:

```bash
npm run build:gh
```

Output goes to `docs/` directory.

## Publishing

**IMPORTANT: Only publish when the user explicitly says 'publish'.**

When the user says 'publish':

1. Ensure all changes are committed to `main` branch
2. Fast-forward `githubio` branch to `main`:
   ```bash
   git checkout githubio
   git merge --ff-only main
   git push origin githubio
   git checkout main
   ```

The GitHub Actions workflow will automatically:
- Run CI checks (lint, build, test)
- Build for GitHub Pages
- Deploy to GitHub Pages

GitHub Pages serves from `docs/` folder on the `githubio` branch.
