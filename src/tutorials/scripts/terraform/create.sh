#!/bin/sh

echo "Initializing terraform..."

# initialize terraform
terraform init

echo ""
echo "Planning cloud infrastructure..."

terraform_plan_file_path=./create.tfplan

echo "Deleting previous plan (if exists)..."
rm -f $terraform_plan_file_path

terraform plan \
  -var-file="$TERRAFORM_VAR_FILE_PATH" \
  --out=$terraform_plan_file_path

if [[ "${TF_APPLY}" == "true" ]]; then

  echo ""
  echo "Setup cloud infrastructure..."

  terraform apply $terraform_plan_file_path

  rm -f $terraform_plan_file_path
fi
