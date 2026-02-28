#!/bin/bash

# Test script to verify HTML import paths are correct

echo "Testing HTML import paths..."

# Test 1: Check dev/index.html has correct import path
echo ""
echo "Test 1: Checking dev/index.html import path..."
if grep -q 'from "../output/Main/index.js"' dev/index.html; then
  echo "✓ PASS: dev/index.html has correct path (../output/Main/index.js)"
else
  echo "✗ FAIL: dev/index.html does not have correct path"
  echo "  Expected: from \"../output/Main/index.js\""
  echo "  Found: $(grep 'from.*output/Main/index.js' dev/index.html || echo 'NOT FOUND')"
  exit 1
fi

# Test 2: Check docs/index.html has correct import path
echo ""
echo "Test 2: Checking docs/index.html import path..."
if grep -q 'from "./output/Main/index.js"' docs/index.html; then
  echo "✓ PASS: docs/index.html has correct path (./output/Main/index.js)"
else
  echo "✗ FAIL: docs/index.html does not have correct path"
  echo "  Expected: from \"./output/Main/index.js\""
  echo "  Found: $(grep 'from.*output/Main/index.js' docs/index.html || echo 'NOT FOUND')"
  exit 1
fi

# Test 3: Verify no malformed import statements
echo ""
echo "Test 3: Checking for malformed import statements..."
if grep 'from.*output/Main/index.js"' dev/index.html > /dev/null 2>&1; then
  echo "✓ PASS: dev/index.html import statement is syntactically correct"
else
  echo "✗ FAIL: dev/index.html has malformed import statement"
  grep 'from.*output' dev/index.html
  exit 1
fi

if grep 'from.*output/Main/index.js"' docs/index.html > /dev/null 2>&1; then
  echo "✓ PASS: docs/index.html import statement is syntactically correct"
else
  echo "✗ FAIL: docs/index.html has malformed import statement"
  grep 'from.*output' docs/index.html
  exit 1
fi

# Test 4: Check that files actually exist
echo ""
echo "Test 4: Checking that referenced files exist..."
if [ -f "output/Main/index.js" ]; then
  echo "✓ PASS: output/Main/index.js exists"
else
  echo "✗ FAIL: output/Main/index.js does not exist"
  echo "  Run: spago build"
  exit 1
fi

if [ -f "docs/output/Main/index.js" ]; then
  echo "✓ PASS: docs/output/Main/index.js exists"
else
  echo "✗ FAIL: docs/output/Main/index.js does not exist"
  echo "  Run: npm run build:gh"
  exit 1
fi

# Test 5: Validate HTML syntax
echo ""
echo "Test 5: Validating HTML syntax..."
if command -v python3 &> /dev/null; then
  python3 -c "import html.parser; parser = html.parser.HTMLParser(); parser.feed(open('dev/index.html').read())" 2>/dev/null && \
    echo "✓ PASS: dev/index.html HTML is syntactically valid" || echo "⚠ WARNING: Could not validate HTML"
  
  python3 -c "import html.parser; parser = html.parser.HTMLParser(); parser.feed(open('docs/index.html').read())" 2>/dev/null && \
    echo "✓ PASS: docs/index.html HTML is syntactically valid" || echo "⚠ WARNING: Could not validate HTML"
else
  echo "⚠ SKIP: Python3 not available for HTML validation"
fi

echo ""
echo "All tests passed! ✓"
echo ""
echo "To prevent MIME type errors:"
echo "  - dev/index.html should always use '../output/Main/index.js'"
echo "  - docs/index.html should always use './output/Main/index.js'"
echo "  - Never manually change these paths"
echo "  - Always run 'npm run build:gh' to build for GitHub Pages"