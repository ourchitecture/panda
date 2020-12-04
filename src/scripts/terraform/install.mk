DEBUG?=false
TF_PLAN_ONLY?=false
TF_VAR_FILE?=

# this can be overridden by a provider
# see: ./azure/install.mk
tf_run_script_path?=/our/terraform/run.sh

.PHONY: terraform-install
terraform-install: require-root require-terraform
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		-e TF_PLAN_ONLY=$(TF_PLAN_ONLY) \
		-e TF_VAR_FILE="$(TF_VAR_FILE)" \
		--entrypoint "$(tf_run_script_path)" \
		$(terraform_docker)
