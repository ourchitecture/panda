#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

[ -z "$ARM_CLIENT_ID" ] && echo "Need to set ARM_CLIENT_ID" && exit 1;
[ -z "$ARM_CLIENT_SECRET" ] && echo "Need to set ARM_CLIENT_SECRET" && exit 1;
[ -z "$ARM_TENANT_ID" ] && echo "Need to set ARM_TENANT_ID" && exit 1;
[ -z "$ARM_SUBSCRIPTION_ID" ] && echo "Need to set ARM_SUBSCRIPTION_ID" && exit 1;
[ -z "$ARM_RESOURCE_GROUP" ] && echo "Need to set ARM_RESOURCE_GROUP" && exit 1;
[ -z "$ARM_REGION" ] && echo "Need to set ARM_REGION" && exit 1;
[ -z "$ARM_APP_NAME" ] && echo "Need to set ARM_APP_NAME" && exit 1;
[ -z "$ARM_APP_PLAN_NAME" ] && echo "Need to set ARM_APP_PLAN_NAME" && exit 1;
[ -z "$ARM_APP_PLAN_OS" ] && echo "Need to set ARM_APP_PLAN_OS" && exit 1;

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/../../../login.sh

mvn=$(${DIR}/../../../../java/maven/mvn.sh)

echo ""
echo "Deploying webapp..."

eval $mvn -B \
  clean \
  package \
  azure-webapp:deploy \
  -Dazure.tenant.id="$ARM_TENANT_ID" \
  -Dazure.client.id="$ARM_CLIENT_ID" \
  -Dazure.client.key="$ARM_CLIENT_SECRET" \
  -Dazure.subscription.id="$ARM_SUBSCRIPTION_ID" \
  -Dazure.resourcegroup="$ARM_RESOURCE_GROUP" \
  -Dazure.region="$ARM_REGION" \
  -Dazure.appservice.name="$ARM_APP_NAME" \
  -Dazure.appservice.plan.name="$ARM_APP_PLAN_NAME" \
  -Dazure.appservice.plan.os="$ARM_APP_PLAN_OS" \
  -Dazure.appservice.plan.pricingtier="$ARM_APP_PLAN_TIER"
