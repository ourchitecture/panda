#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/../../azure/login.sh

source ${DIR}/../apply.sh $@
