#!/bin/sh

# exit the script if any statement returns a non-true return value
set -e

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

if [[ ! -z "${ARM_SUBSCRIPTION_ID}" ]]; then
  echo ""
  echo "Setting default subscription..."

  az account set -s "$ARM_SUBSCRIPTION_ID" > /dev/null
fi
