#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

[ -z "$ARM_RESOURCE_GROUP" ] && echo "Need to set ARM_RESOURCE_GROUP" && exit 1;
[ -z "$ARM_APP_SERVICE_PLAN_NAME" ] && echo "Need to set ARM_APP_SERVICE_PLAN_NAME" && exit 1;
[ -z "$ARM_APP_SERVICE_PLAN_LOCATION" ] && echo "Need to set ARM_APP_SERVICE_PLAN_LOCATION" && exit 1;
[ -z "$ARM_APP_SKU" ] && echo "Need to set ARM_APP_SKU" && exit 1;
[ -z "$ARM_APP_NAME" ] && echo "Need to set ARM_APP_NAME" && exit 1;

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/../login.sh

echo ""
echo "Deploying webapp..."

az webapp up \
  -g "${ARM_RESOURCE_GROUP}" \
  -p "${ARM_APP_SERVICE_PLAN_NAME}" \
  -l "${ARM_APP_SERVICE_PLAN_LOCATION}" \
  --sku "${ARM_APP_SKU}" \
  -n "${ARM_APP_NAME}"
