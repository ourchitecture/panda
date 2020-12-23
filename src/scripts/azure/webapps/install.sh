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
echo "Deploying webapp..."

deploy_zip_file_name=app.deploy.zip

if [[ -f "${deploy_zip_file_name}" ]]; then
  echo ""
  echo "Removing previous file ${deploy_zip_file_name}..."

  rm -f "${deploy_zip_file_name}"
fi

echo ""
echo "Preparing deployment archive ${deploy_zip_file_name}..."
zip -r "${deploy_zip_file_name}" .

# IMPORTANT: a bug was found when deploying Yarn 2 Node.js
# applications using the Oryx build process. This script
# previously used `az webapp up ...`. The work-around was
# to use the alternative zip process. This is certain to
# have issues with applications that contain build output
# in another directory, like Angular web applications.
# Another tutorial should be built and tested that addresses
# this issue.
# https://github.com/microsoft/Oryx/issues/895

echo ""
echo "Deploying archive to azure using ${deploy_zip_file_name}..."
az webapp deployment source config-zip \
  --resource-group "${ARM_RESOURCE_GROUP}" \
  --name "${ARM_APP_NAME}" \
  --src "${deploy_zip_file_name}"

echo ""
echo "Removing deployment file ${deploy_zip_file_name}..."
rm -f "${deploy_zip_file_name}"
