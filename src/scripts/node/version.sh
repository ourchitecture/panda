#!/bin/sh

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

echo ""
echo "Node version..."
node --version

echo ""
echo "Node package manager version..."
npm --version

echo ""
echo "Node package executor version..."
npx --version
