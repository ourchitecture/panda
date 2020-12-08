#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

# if no storage account was defined
if [[ -z "${ARM_TERRAFORM_BACKEND_RESOURCE_GROUP}" ]]; then
  echo ""
  echo "Initializing terraform without a backend..."

  # initialize terraform
  terraform init -backend=false
else
  echo ""
  echo "Initializing terraform with Azure backend..."

  [ -z "$ARM_TERRAFORM_BACKEND_RESOURCE_GROUP" ] && echo "Need to set ARM_TERRAFORM_BACKEND_RESOURCE_GROUP" && exit 1;
  [ -z "$ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT" ] && echo "Need to set ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT" && exit 1;
  [ -z "$ARM_TERRAFORM_BACKEND_CONTAINER" ] && echo "Need to set ARM_TERRAFORM_BACKEND_CONTAINER" && exit 1;
  [ -z "$ARM_TERRAFORM_BACKEND_KEY" ] && echo "Need to set ARM_TERRAFORM_BACKEND_KEY" && exit 1;

  # initialize terraform with Azure backend
  terraform init \
    -backend-config="resource_group_name=${ARM_TERRAFORM_BACKEND_RESOURCE_GROUP}" \
    -backend-config="storage_account_name=${ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT}" \
    -backend-config="container_name=${ARM_TERRAFORM_BACKEND_CONTAINER}" \
    -backend-config="key=${ARM_TERRAFORM_BACKEND_KEY}"
fi
