#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

[ -z "$ARM_RESOURCE_GROUP" ] && echo "Need to set ARM_RESOURCE_GROUP" && exit 1;
[ -z "$ARM_APP_NAME" ] && echo "Need to set ARM_APP_NAME" && exit 1;

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/../login.sh

echo ""
echo "Destroying webapp..."

az webapp delete \
  -g "${ARM_RESOURCE_GROUP}" \
  -n "${ARM_APP_NAME}"

echo "Successfully deleted the webapp ${ARM_APP_NAME}."
