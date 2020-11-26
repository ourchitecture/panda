#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

# run the azure login script
# see: "./src/tutorials/scripts/*"
source /usr/local/bin/our-scripts/azure/login.sh

echo ""
echo "Creating webapp..."

az webapp up \
  -g "$ARM_RESOURCE_GROUP" \
  -p "$APP_SERVICE_PLAN_NAME" \
  --os-type "$APP_SERVICE_PLAN_OS" \
  -l "$APP_SERVICE_PLAN_LOCATION" \
  --sku "$APP_SKU" \
  -n "$APP_NAME" \
  -r "node|12-lts"
