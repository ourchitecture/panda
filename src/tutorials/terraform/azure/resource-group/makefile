# the prefix to use on running docker containers
docker_name_prefix=our-terraform-azure-rg

# the relative path to "./src/tutorials/scripts"
scripts_relative_dir=../../../scripts/

# the terraform variable file
var-file="./tutorial.tfvars"

include $(scripts_relative_dir)git-docker.mk
include $(scripts_relative_dir)docker.mk
include $(scripts_relative_dir)azure.mk
include $(scripts_relative_dir)terraform.mk

clean: clean-terraform
