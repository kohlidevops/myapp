#!/bin/bash

echo "[Test] Starting static site checks..."

# Check if required files exist
[ -f index.html ] && echo "✅ index.html exists" || { echo "❌ index.html missing"; exit 1; }
[ -f style.css ] && echo "✅ style.css exists" || { echo "❌ style.css missing"; exit 1; }
[ -f script.js ] && echo "✅ script.js exists" || { echo "❌ script.js missing"; exit 1; }

# Validate HTML (optional: use htmlhint if available)
if command -v tidy > /dev/null; then
    echo "[Test] Validating HTML syntax..."
    tidy -e index.html || { echo "❌ HTML validation failed"; exit 1; }
else
    echo "[Test] Skipping HTML validation (tidy not installed)"
fi

echo "[Test] All checks passed!"