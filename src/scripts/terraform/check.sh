#!/bin/sh

# IMPORTANT: this is not "/bin/bash" to enable use on Linux Alpine.
# A common difference is that "/bin/sh" uses "if [ ... ]", not "if [[ ... ]]"

# exit the script if any statement returns a non-true return value
set -e

echo "Clearing existing '.terraform' directory (if exists)..."
# clean previous state
rm -rf .terraform

echo "Initializing terraform without a backend..."

# initialize terraform without a remote backend
terraform init -backend=false

echo "Checking terraform formatting..."

# do not exit on non-zero exit codes
# ALL exit codes must be properly handled
# this allows the script to provide helpful error messaging
set +e

# check terraform file formatting
terraform fmt -check -recursive

fmt_exit_code=$?

if [ "$fmt_exit_code" -eq "3" ]; then
  echo "Invalid terraform formatting."
  echo "To fix, try running: terraform fmt -recursive"
  echo "Or, simply run: make format"
  exit $fmt_exit_code
elif [ "$fmt_exit_code" -ne "0" ]; then
  echo "Unknown terraform formatting error"
  echo "To fix, try running: terraform fmt -recursive"
  echo "Or, simply run: make format"
  exit $fmt_exit_code
fi

# exit the script if any statement returns a non-true return value
set -e

echo "Validating terraform..."

# validate the terraform code
terraform validate
