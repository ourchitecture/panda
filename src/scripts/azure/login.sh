#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

# if [[ "${DEBUG}" = true ]]; then
# never dynamically debug login (do not expose credentials or OII)
set +x

if [[ -z "${ARM_CLIENT_ID}" ]]; then
  echo ""
  echo "Interactive Azure login..."

  if [[ -z "${ARM_TENANT_ID}" ]]; then
    # use interactive login (open web browser and type the code)
    # redirect successful output (not needed)
    az login --allow-no-subscriptions > /dev/null
  else
    # use interactive login (open web browser and type the code)
    # specify tenant id
    # redirect successful output (not needed)
    az login --allow-no-subscriptions --tenant $ARM_TENANT_ID > /dev/null
  fi
else
  [ -z "$ARM_CLIENT_ID" ] && echo "Need to set ARM_CLIENT_ID" && exit 1;
  [ -z "$ARM_CLIENT_SECRET" ] && echo "Need to set ARM_CLIENT_SECRET" && exit 1;
  [ -z "$ARM_TENANT_ID" ] && echo "Need to set ARM_TENANT_ID" && exit 1;

  echo ""
  echo "Initiating service principal login..."

  # use service principal login
  # redirect successful output (not needed)
  az login --allow-no-subscriptions --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID > /dev/null
fi

if [[ ! -z "${ARM_SUBSCRIPTION_ID}" ]]; then
  echo ""
  echo "Setting default subscription..."

  az account set -s "$ARM_SUBSCRIPTION_ID" > /dev/null
fi

# reset debug after in case other scripts expect the original setting
if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi
