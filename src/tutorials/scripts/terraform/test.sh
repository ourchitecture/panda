#!/bin/sh

# exit the script if any statement returns a non-true return value
set -e

echo "Clearing existing '.terraform' directory (if exists)..."
# clean previous state
rm -rf .terraform

echo "Initializing terraform without a backend..."

# initialize terraform without a remote backend
terraform init -backend=false

echo "Checking terraform formatting..."

# check terraform file formatting
terraform fmt -check -recursive

echo "Validating terraform..."

# validate the terraform code
terraform validate
