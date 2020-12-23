#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/../../../login.sh

mvn=$(${DIR}/../../../../java/maven/mvn.sh)

echo ""
echo "Deploying webapp..."

eval $mvn --version

# ./mvnw -B clean package azure-webapp:deploy \
#   "-Dazure.tenant.id=$(tenant-id)" \
#   "-Dazure.client.id=$(client-id)" \
#   "-Dazure.client.key=$(client-key)" \
#   "-Dazure.subscription.id=$(subscription-id)" \
#   "-Dazure.resourcegroup=$(resource-group)" \
#   "-Dazure.region=$(region)" \
#   "-Dazure.appservice.name=$(appservice-name)" \
#   "-Dazure.appservice.plan.name=$(appservice-plan-name)" \
#   "-Dazure.appservice.plan.os=$(appservice-plan-os)" \
#   "-Dazure.appservice.plan.pricingtier=$(appservice-plan-tier)"
