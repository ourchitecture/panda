#!/bin/sh

# get current script directory path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/../../azure/login.sh

source ${DIR}/../destroy.sh
