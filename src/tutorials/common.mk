# Dependencies:
# - ../../../root.mk

TF_VAR_FILE=./tutorial.tfvars

# default resource group specified for
# convenience, so engineers do not have
# to specify it every single time
ARM_RESOURCE_GROUP=our-tutorials-rg

include $(scripts_dir_path)/docker/common.mk

prerequisites:
	@echo ""
	@echo "GNU Make 4 or later is required. You have:"
	@echo "------------------------------------------"
	@make --version
	@echo ""
	@echo "Git 2.20 or later is required. You have:"
	@echo "----------------------------------------"
	@git --version
	@echo ""
	@echo "Docker 19.03.0 or later is required. You have:"
	@echo "----------------------------------------------"
	@docker --version
