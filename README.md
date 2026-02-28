# Julia Glinka Fotografia & Hyunjin Motion

A PureScript/Halogen project containing two interactive web applications:

## Applications

### 1. Julia Glinka Fotografia (`/dev/index.html`)
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

### 2. Hyunjin Brownian Motion (`/dev/brownian.html`)
Interactive particle visualization featuring Hyunjin images.

**Features:**
- Brownian motion physics simulation
- Particle collision and repulsion
- Border bouncing
- K-Pop styled UI with animated gradients
- Click to add particles at cursor position
- Particle trails with glow effects

## Quick Start

```sh
npm install
npm run build
npm run serve
```

Then open http://localhost:1234/dev/index.html

## Project Structure

```
├── dev/
│   ├── index.html          # Portfolio app
│   ├── brownian.html       # Brownian motion app
│   ├── index.js            # Entry point
│   └── images/             # Session photos (30 images)
│       ├── julia.jpg       # Photographer portrait
│       └── session-*.jpg   # Portfolio photos
├── src/
│   ├── Main.purs           # Main entry point
│   └── App/
│       ├── Portfolio.purs  # Photography portfolio
│       └── Brownian.purs   # Brownian motion app
├── output/                 # Compiled PureScript
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
- aff - Asynchronous effects
- arrays, foldable-traversable - Data structures
- random - Random number generation
- web-dom, web-html, web-uievents - Web APIs

## Notes

- Images are extracted from the original PDF offer document
- All client testimonials are authentic
- Contact information and pricing are real (2026)
- The Brownian motion app uses canvas rendering with FFI

## License

Original template: MIT License
Project content: All rights reserved Julia Glinka Fotografia
