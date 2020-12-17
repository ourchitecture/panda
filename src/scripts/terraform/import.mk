DEBUG?=false
TF_PLAN_ONLY?=false

# this can be overridden by a provider
# see: ./azure/install.mk
tf_run_script_path?=/our/terraform/import.sh

.PHONY: terraform-import
terraform-import: require-root require-terraform
ifndef RESOURCE_ADDRESS
	$(error RESOURCE_ADDRESS is not set)
endif
ifndef RESOURCE_ID
	$(error RESOURCE_ID is not set)
endif
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e DEBUG=$(DEBUG) \
		$(docker_arg_env_file) \
		-e RESOURCE_ADDRESS="$(RESOURCE_ADDRESS)" \
		-e RESOURCE_ID="$(RESOURCE_ID)" \
		-e TF_VAR_FILE="$(TF_VAR_FILE)" \
		--network host \
		--entrypoint "$(tf_import_script_path)" \
		$(terraform_docker)
