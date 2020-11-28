# Dependencies:
# - ../../../root.mk

include $(scripts_dir_path)/terraform/base.mk

.PHONY: plan-install-var-file
plan-install-var-file: tf-required-vars
ifndef var-file
	$(error var-file is not set)
endif
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e TERRAFORM_VAR_FILE_PATH="$(var-file)" \
		$(docker_az_terraform) \
		/our/terraform/plan.sh

.PHONY: install
install: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		/our/terraform/apply.sh

.PHONY: plan-uninstall-var-file
plan-uninstall-var-file: tf-required-vars
ifndef var-file
	$(error var-file is not set)
endif
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e TERRAFORM_DESTROY=true \
		-e TERRAFORM_VAR_FILE_PATH="$(var-file)" \
		$(docker_az_terraform) \
		/our/terraform/destroy.sh

.PHONY: uninstall
uninstall: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e TERRAFORM_DESTROY=true \
		$(docker_az_terraform) \
		/our/terraform/apply.sh
