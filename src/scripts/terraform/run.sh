#!/bin/bash

# exit the script if any statement returns a non-true return value
set -e

if [[ "${DEBUG}" = true ]]; then
  # expands variables and prints a little + sign before the line
  set -x
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

tf_exec_plan=false
tf_exec_apply=false

tf_msg_apply=""

tf_arg_plan_file_name=""
tf_arg_destroy_flag=""
tf_arg_var_file=""

if [[ "${TF_PLAN_ONLY}" = true ]]; then
  tf_plan_only=true
  tf_exec_plan=true

  tf_arg_plan_file_name="./create.tfplan"
  tf_msg_apply="Setting up cloud infrastructure..."
else
  tf_exec_apply=true
fi

if [[ ! -z "${TF_DESTROY}" ]]; then
  tf_exec_plan=true

  tf_arg_plan_file_name="./destroy.tfplan"
  tf_arg_destroy_flag=" --destroy"
  tf_msg_apply="Destroying cloud infrastructure..."
fi

if [[ ! -z "${TF_VAR_FILE}" ]]; then
  tf_arg_var_file="-var-file=${TF_VAR_FILE}"
fi

# initialize terraform
source ${DIR}/init.sh

if [[ "$tf_exec_plan" = true ]]; then

  if [[ -f "${tf_arg_plan_file_name}" ]]; then
    echo ""
    echo "Removing previous file ${tf_arg_plan_file_name}..."

    rm -f "${tf_arg_plan_file_name}"
  fi

  echo ""
  echo "Creating ${tf_arg_plan_file_name}..."

  terraform plan \
    $tf_arg_destroy_flag \
    $tf_arg_var_file \
    --out "${tf_arg_plan_file_name}"
fi

if [[ "$tf_exec_apply" = true ]]; then

  if [[ ! -z "$tf_arg_plan_file_name" ]]; then
    # cannot have a plan and a "-var-arg" file
    # the plan will already have applied the variables
    tf_arg_var_file=""
  fi

  echo ""
  echo $tf_msg_apply

  terraform apply \
    -auto-approve \
    -refresh=true \
    $tf_arg_var_file \
    $tf_arg_plan_file_name

  if [[ -f "${tf_arg_plan_file_name}" ]]; then
    echo ""
    echo "Removing plan ${tf_arg_plan_file_name}..."

    rm -f "${tf_arg_plan_file_name}"
  fi
fi
