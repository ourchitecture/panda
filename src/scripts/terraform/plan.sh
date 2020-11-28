#!/bin/sh

# exit the script if any statement returns a non-true return value
set -e

echo "Initializing terraform..."

# initialize terraform
terraform init

echo ""
echo "Planning cloud infrastructure changes..."

terraform_plan_file_path=./create.tfplan
terraform_destroy_flag=""

# if destroy flag exists
if [[ ! -z "${TERRAFORM_DESTROY}" ]]; then

  terraform_plan_file_path=./destroy.tfplan

  echo ""
  echo "Adding destroy flag to remove cloud infrastructure."
  echo ""
  terraform_destroy_flag=" --destroy"
fi

echo "Deleting previous plan (if exists)..."
rm -f $terraform_plan_file_path

if [[ -z "${TERRAFORM_VAR_FILE_PATH}" ]]; then
  if [ $# -eq 0 ]; then
    eval terraform plan \
      $terraform_destroy_flag \
      --out="$terraform_plan_file_path"
  else
    eval terraform plan \
      $terraform_destroy_flag \
      $@ \
      --out="$terraform_plan_file_path"
  fi
else
  if [ $# -eq 0 ]; then
    eval terraform plan \
      $terraform_destroy_flag \
      -var-file="$TERRAFORM_VAR_FILE_PATH" \
      --out="$terraform_plan_file_path"
  else
    eval terraform plan \
      $terraform_destroy_flag \
      -var-file="$TERRAFORM_VAR_FILE_PATH" \
      $@ \
      --out="$terraform_plan_file_path"
  fi
fi
