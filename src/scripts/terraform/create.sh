#!/bin/sh

# exit the script if any statement returns a non-true return value
set -e

terraform_plan_file_path=./create.tfplan

echo ""
echo "Setup cloud infrastructure..."

terraform apply $terraform_plan_file_path

rm -f $terraform_plan_file_path
