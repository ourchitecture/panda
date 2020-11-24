#!/bin/sh

# exit the script if any statement returns a non-true return value
set -e

echo ""
echo "Interactive Azure login..."

az login --allow-no-subscriptions > /dev/null

echo "Initializing terraform..."

# initialize terraform
terraform init

echo ""
echo "Planning cloud infrastructure..."

terraform_plan_file_path=./destroy.tfplan

echo "Deleting previous plan (if exists)..."
rm -f $terraform_plan_file_path

terraform plan --destroy \
  -var-file="$TERRAFORM_VAR_FILE_PATH" \
  --out=$terraform_plan_file_path

if [[ "${TF_APPLY}" == "true" ]]; then

  echo ""
  echo "Destroy cloud infrastructure..."

  terraform apply $terraform_plan_file_path

  rm -f $terraform_plan_file_path
fi
