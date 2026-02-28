# Julia Glinka Fotografia

Professional photography portfolio website for maternity photography sessions in Warsaw, Poland.

## Features
Professional photography portfolio website for maternity photography sessions in Warsaw, Poland.

**Features:**
- Elegant, minimalist design with Tailwind CSS
- Responsive layout for all devices
- Photo gallery with session images
- Service descriptions and pricing packages
- Client testimonials
- Contact information

**Content:**
- Real contact: juliya.glinka@gmail.com, 513 775 857
- Instagram: @julia_glinka_fotografia
- Three packages: Basic (650 zł), Standard (970 zł), Premium (1350 zł)
- Additional services: Makeup (250 zł), Makeup + hair styling (350 zł)

## Quick Start

### Local Development

```sh
npm install
npm run build
npm run serve
```

Then open http://localhost:1234/dev/index.html

### GitHub Pages Deployment

Build for GitHub Pages:

```sh
npm run build:gh
```

This creates a `docs/` folder with all files ready for deployment.

To deploy to GitHub Pages:

1. **Build** project:
   ```sh
   npm run build:gh
   ```

2. **Commit** docs folder:
   ```sh
   git add docs/
   git commit -m "Build for GitHub Pages"
   git push
   ```

3. **Configure GitHub Pages:**
   - Go to your repository Settings → Pages
   - Set Source to: Deploy from a branch
   - Set Branch to: `master` (or your main branch)
   - Set Folder to: `/docs`
   - Save settings

4. **Wait for deployment** - Your site will be available at `https://your-username.github.io/juliaglinka/`

## Project Structure

```
├── dev/
│   ├── index.html          # Portfolio app
│   ├── index.js            # Entry point
│   └── images/             # Session photos (30 images)
│       ├── julia.jpg       # Photographer portrait
│       └── session-*.jpg   # Portfolio photos
├── docs/                  # Built files for GitHub Pages
├── src/
│   ├── Main.purs           # Main entry point
│   └── App/
│       └── Portfolio.purs  # Photography portfolio
├── output/                 # Compiled PureScript
├── build-gh.sh            # GitHub Pages build script
├── spago.dhall            # Dependencies
└── package.json           # npm scripts
```

## Technologies

- **PureScript** - Type-safe functional language
- **Halogen** - Declarative UI library
- **Tailwind CSS** - Utility-first CSS framework (CDN)
- **Spago** - PureScript package manager

## Development

Build the project:
```sh
npm run build
```

Start development server:
```sh
npm run serve
```

## Dependencies

Key PureScript packages:
- halogen - UI components
- arrays, foldable-traversable - Data structures
- web-dom, web-html, web-uievents - Web APIs

## Notes

- Images are extracted from original PDF offer document
- All client testimonials are authentic
- Contact information and pricing are real (2026)

## License

Original template: MIT License
Project content: All rights reserved Julia Glinka Fotografia
