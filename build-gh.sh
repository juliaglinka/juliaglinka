#!/bin/bash

# GitHub Pages build script for Julia Glinka Fotografia

set -e

echo "Building for GitHub Pages..."

# Clean and create docs directory
rm -rf docs
mkdir -p docs/images

# Build PureScript project
echo "Building PureScript project..."
spago build

# Build Tailwind CSS
echo "Building Tailwind CSS..."
npx tailwindcss -i ./dev/input.css -o ./dev/styles.css --minify

# Bundle JavaScript
echo "Bundling JavaScript..."
npx esbuild dev/entry.js --bundle --format=esm --outfile=dev/bundle.js --minify

# Copy HTML files
echo "Copying HTML files..."
cp dev/index.html docs/index.html

# Copy compiled CSS
echo "Copying CSS..."
cp dev/styles.css docs/styles.css

# Copy bundled JS
echo "Copying bundled JS..."
cp dev/bundle.js docs/bundle.js

# Copy images
echo "Copying images..."
cp -r dev/images/* docs/images/

# Create .nojekyll file for GitHub Pages (to ignore _ folders)
touch docs/.nojekyll

echo "Build complete! Files are in docs/ directory"
echo ""
echo "To deploy to GitHub Pages:"
echo "1. git add docs/"
echo "2. git commit -m 'Build for GitHub Pages'"
echo "3. git push"
echo "4. Configure GitHub Pages to use 'docs' folder as source"
