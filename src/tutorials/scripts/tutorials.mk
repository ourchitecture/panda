# Dependencies:
# - ../../../root.mk

TF_VAR_FILE=./tutorial.tfvars
RESOURCE_GROUP=our-tutorials-rg

tutorials_scripts_dir_path=$(src_dir_path)/tutorials/scripts

include $(tutorials_scripts_dir_path)/make-git-docker.mk

include $(scripts_dir_path)/docker/common.mk
