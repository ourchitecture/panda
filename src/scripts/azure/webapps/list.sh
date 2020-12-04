#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

[ -z "$ARM_RESOURCE_GROUP" ] && echo "Need to set ARM_RESOURCE_GROUP" && exit 1;

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/../login.sh

az webapp list \
  -g "${ARM_RESOURCE_GROUP}" \
  --query "[].{name:name, kind:kind, location:location, state:state, defaultHostName:defaultHostName}" \
  -o table
