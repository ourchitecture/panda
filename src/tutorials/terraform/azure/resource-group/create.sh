#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

# run the azure login script
# see: "./src/tutorials/scripts/*"
source /usr/local/bin/our-scripts/azure/login.sh

# run the terraform create script
# see: "./src/tutorials/scripts/*"
source /usr/local/bin/our-scripts/terraform/create.sh
