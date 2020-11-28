#!/bin/sh

# exit the script if any statement returns a non-true return value
set -e

terraform_plan_file_path=""

# if NO destroy flag exists
if [[ -z "${TERRAFORM_DESTROY}" ]]; then

  terraform_plan_file_path=./create.tfplan

  echo ""
  echo "Setting up cloud infrastructure..."
else

  terraform_plan_file_path=./destroy.tfplan

  echo ""
  echo "Destroying cloud infrastructure..."
fi

terraform apply $terraform_plan_file_path

rm -f $terraform_plan_file_path
