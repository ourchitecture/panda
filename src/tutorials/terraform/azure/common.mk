ARM_RESOURCE_GROUP?="rg-our-tutorials"
TF_VAR_FILE?=tutorial.tfvars

include $(scripts_dir_path)/prerequisites.mk

include $(scripts_dir_path)/docker/.vars.mk

include $(scripts_dir_path)/terraform/.vars.mk
include $(scripts_dir_path)/terraform/init.mk
include $(scripts_dir_path)/terraform/check.mk
include $(scripts_dir_path)/terraform/clean.mk
include $(scripts_dir_path)/terraform/format.mk

include $(scripts_dir_path)/terraform/azure/install.mk
include $(scripts_dir_path)/terraform/azure/uninstall.mk

include $(scripts_dir_path)/azure/.vars.mk
include $(scripts_dir_path)/azure/locations/list.mk
include $(scripts_dir_path)/azure/app-service-plans/list.mk
include $(scripts_dir_path)/azure/resource-groups/list.mk
include $(scripts_dir_path)/azure/storage-accounts/list.mk
include $(scripts_dir_path)/azure/webapps/list.mk

.DEFAULT_GOAL := all

.PHONY: all
all: format check init

.PHONY: init
init: terraform-init

.PHONY: format
format: terraform-format

.PHONY: check
check: terraform-check

.PHONY: install
install: terraform-install

.PHONY: uninstall
uninstall: terraform-uninstall

.PHONY: clean
clean: terraform-clean
