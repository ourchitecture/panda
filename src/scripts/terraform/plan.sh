#!/bin/sh

# exit the script if any statement returns a non-true return value
set -e

echo "Initializing terraform..."

# initialize terraform
terraform init

echo ""
echo "Planning cloud infrastructure..."

terraform_plan_file_path=./create.tfplan

echo "Deleting previous plan (if exists)..."
rm -f $terraform_plan_file_path

if [[ -z "${TERRAFORM_VAR_FILE_PATH}" ]]; then
  if [ $# -eq 0 ]; then
    terraform plan --out=$terraform_plan_file_path
  else
    eval "terraform plan $@ --out=$terraform_plan_file_path"
  fi
else
  if [ $# -eq 0 ]; then
    terraform plan \
      -var-file="$TERRAFORM_VAR_FILE_PATH" \
      --out=$terraform_plan_file_path
  else
    eval "terraform plan -var-file="$TERRAFORM_VAR_FILE_PATH" $@ --out=$terraform_plan_file_path"
  fi
fi
