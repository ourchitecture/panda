#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

tf_arg_var_file=""

if [[ ! -z "${TF_VAR_FILE}" ]]; then
  tf_arg_var_file="-var-file=${TF_VAR_FILE}"
fi

# initialize terraform
source ${DIR}/init.sh

[ -z "$RESOURCE_ADDRESS" ] && echo "Need to set RESOURCE_ADDRESS" && exit 1;
[ -z "$RESOURCE_ID" ] && echo "Need to set RESOURCE_ID" && exit 1;

echo ""
echo "Importing resource..."

terraform import \
  $tf_arg_var_file \
  "${RESOURCE_ADDRESS}" \
  "${RESOURCE_ID}"
