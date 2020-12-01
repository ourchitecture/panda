#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/login.sh

echo ""
echo "Deploying webapp..."

az webapp up \
  -g "${ARM_RESOURCE_GROUP}" \
  -p "${ARM_APP_SERVICE_PLAN_NAME}" \
  -l "${ARM_APP_SERVICE_PLAN_LOCATION}" \
  --sku "${ARM_APP_SKU}" \
  -n "${ARM_APP_NAME}"
