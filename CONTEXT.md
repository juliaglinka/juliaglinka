# Project Context

## Goal

The user wanted to:
1. Fix issues with a PureScript Halogen project
2. Create a professional photography portfolio website for "Julia Glinka Fotografia" - a maternity photography business in Warsaw, Poland
3. Extract real photos from a PDF offer document and integrate them into the portfolio
4. Style everything elegantly using Tailwind CSS
5. Deploy to GitHub Pages

## Instructions

- Create professional photography portfolio website with elegant, minimalist design
- Extract photos from `/home/ag/Downloads/Oferta-sesja-ciazowa-2026.pdf`
- Use real contact info, pricing, and testimonials from the PDF
- Use Tailwind CSS CDN for styling (elegant, minimalist, no colorful icons)
- Use standard Tailwind classes (not arbitrary values like `text-[11px]`) for CDN compatibility
- Serve using Python HTTP server instead of Parcel due to module loading issues

## Discoveries

- Parcel bundler had issues serving ES modules with PureScript output - Python's `http.server` works better
- Tailwind CDN doesn't support arbitrary values (bracket notation like `text-[11px]`, `tracking-[0.2em]`) - must use standard classes
- Image paths need `./` prefix for proper resolution
- Halogen apps render to body directly - don't need a loading div placeholder
- PDF image extraction: `pdfimages -j` extracts JPEG images from PDFs
- The "accent" color in Tailwind config must be defined for custom colors to work

## Accomplished

1. **Fixed initial project issues** - removed unused imports, fixed dependencies
2. **Created Portfolio app** (`src/App/Portfolio.purs`):
   - Hero section with photographer name and CTA
   - About section with Julia's photo and story
   - Services section (4 service cards)
   - Gallery section (16 session photos)
   - Pricing packages (Basic 650zł, Standard 970zł, Premium 1350zł)
   - Testimonials (6 real client reviews)
   - Contact section with real info
   - Responsive navigation with mobile menu
3. **Extracted 30 photos from PDF**:
   - `julia.jpg` (photographer portrait from page 1)
   - `session-01.jpg` through `session-29.jpg` (portfolio photos)
4. **Styled with Tailwind CSS** - elegant stone/neutral color palette
5. **Fixed styling issues** - replaced all arbitrary Tailwind values with standard classes
6. **Created GitHub Pages build script** (`build-gh.sh`) for easy deployment
7. **Committed to git** with comprehensive README.md

## Relevant files / directories

```
/home/ag/wsp/juliaglinka/
├── dev/
│   ├── index.html          # Portfolio HTML with Tailwind CDN
│   ├── index.js            # ES module entry: import { main } from "../output/Main/index.js"
│   └── images/
│       ├── julia.jpg       # Photographer portrait
│       └── session-*.jpg   # 29 session photos
├── docs/                  # Built files for GitHub Pages
├── src/
│   ├── Main.purs           # Entry point, runs Portfolio.component
│   └── App/
│       └── Portfolio.purs  # Photography portfolio Halogen component
├── spago.dhall             # Dependencies: halogen, arrays, web-dom, web-html, etc.
├── package.json            # serve and build scripts
├── serve.sh                # Development server script
├── build-gh.sh            # GitHub Pages build script
└── README.md               # Project documentation
```

## Key PureScript modules

- `src/Main.purs` - Entry point, runs Portfolio component
- `src/App/Portfolio.purs` - Full portfolio with sections: Nav, Hero, About, Services, Gallery, Packages, Testimonials, Contact, Footer

## Current state

Portfolio app loads and displays correctly at http://localhost:1234/dev/index.html
Ready for GitHub Pages deployment with `npm run build:gh`
