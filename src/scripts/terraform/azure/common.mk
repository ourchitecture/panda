# Dependencies:
# - ../../../../root.mk
# - ../docker.mk

include $(scripts_dir_path)/terraform/base.mk

azure_terraform_docker_name_prefix=our-scripts-terraform-azure-make

.PHONY: tf-az-required-vars
tf-az-required-vars: tf-required-vars
ifndef azure_terraform_docker_name_prefix
	$(error azure_terraform_docker_name_prefix is not set)
endif

.PHONY: plan-install-var-file
plan-install-var-file: tf-az-required-vars
ifndef var-file
	$(error var-file is not set)
endif
	@docker run --rm -t \
		--name $(azure_terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e TERRAFORM_VAR_FILE_PATH="$(var-file)" \
		$(docker_az_terraform) \
		/our/terraform/azure/plan.sh

.PHONY: install
install: tf-az-required-vars
	@docker run --rm -t \
		--name $(azure_terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		/our/terraform/azure/apply.sh

.PHONY: plan-uninstall-var-file
plan-uninstall-var-file: tf-az-required-vars
ifndef var-file
	$(error var-file is not set)
endif
	@docker run --rm -t \
		--name $(azure_terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e TERRAFORM_DESTROY=true \
		-e TERRAFORM_VAR_FILE_PATH="$(var-file)" \
		$(docker_az_terraform) \
		/our/terraform/azure/plan.sh

.PHONY: uninstall
uninstall: tf-az-required-vars
	@docker run --rm -t \
		--name $(azure_terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e TERRAFORM_DESTROY=true \
		$(docker_az_terraform) \
		/our/terraform/azure/apply.sh
