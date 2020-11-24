# the prefix to use on running docker containers
docker_name_prefix=our-terraform-azure-appservice-plan

# the relative path to "./src/tutorials/scripts"
scripts_relative_dir=../../../scripts/

# the terraform variable file
var-file="./tutorial.tfvars"

include ../../../scripts/git-docker.mk
include ../../../scripts/docker.mk
include ../../../scripts/azure.mk
include ../../../scripts/terraform.mk

clean: clean-terraform
