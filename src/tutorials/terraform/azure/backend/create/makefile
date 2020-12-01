include ../../../../../../root.mk

include $(scripts_dir_path)/terraform/azure/common.mk

docker_name_prefix=our-tutorials-terraform-azure-backend-create-make

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

.PHONY: my-required-vars
my-required-vars:
ifndef docker_name_prefix
	$(error docker_name_prefix is not set)
endif
ifndef scripts_dir_path
	$(error scripts_dir_path is not set)
endif
ifndef my_dir_path
	$(error my_dir_path is not set)
endif
ifndef docker_az_terraform
	$(error docker_az_terraform is not set)
endif

.PHONY: plan
plan: my-required-vars
ifndef resource-group
	$(error resource-group is not set)
endif
ifndef location
	$(error location is not set)
endif
	@docker run --rm -t \
		--name $(docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		/our/terraform/azure/plan.sh \
			'-var="rg_name=$(resource-group)" -var="rg_location=$(location)"'
