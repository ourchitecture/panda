#!/bin/sh

set -e

echo "Cleaning project terraform temporary files"

rm -rf .terraform *.tfstate *.backup

echo "Successfully cleaned."
