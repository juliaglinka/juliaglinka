#!/bin/bash

# GitHub Pages build script for Julia Glinka Fotografia

set -e

echo "Building for GitHub Pages..."

# Clean and create githubio directory
rm -rf githubio
mkdir -p githubio/images

# Build PureScript project
echo "Building PureScript project..."
spago build

# Copy HTML files
echo "Copying HTML files..."
cp dev/index.html githubio/index.html

# Copy PureScript output
echo "Copying PureScript output..."
cp -r output githubio/

# Copy images
echo "Copying images..."
cp -r dev/images/* githubio/images/

# Fix paths in HTML files for githubio folder
echo "Fixing paths in HTML files..."

# For index.html - change ../output/ to ./output/
sed -i 's|../output/|./output/|g' githubio/index.html

# Minify HTML (optional - requires html-minifier-terser)
# Uncomment following lines if you want HTML minification:
# if command -v html-minifier-terser &> /dev/null; then
#   echo "Minifying HTML files..."
#   html-minifier-terser --collapse-whitespace --remove-comments --remove-optional-tags --minify-css true --minify-js true githubio/index.html -o githubio/index.html
# fi

# Create .nojekyll file for GitHub Pages (to ignore _ folders)
touch githubio/.nojekyll

echo "Build complete! Files are in githubio/ directory"
echo ""
echo "To deploy to GitHub Pages:"
echo "1. git add githubio/"
echo "2. git commit -m 'Build for GitHub Pages'"
echo "3. git push"
echo "4. Configure GitHub Pages to use as 'githubio' folder as source"
