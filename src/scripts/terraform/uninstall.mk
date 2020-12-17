DEBUG?=false
TF_PLAN_ONLY?=false
TF_VAR_FILE?=""

.PHONY: terraform-uninstall
terraform-uninstall: require-root require-terraform
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		-e TF_PLAN_ONLY=$(TF_PLAN_ONLY) \
		-e TF_DESTROY=true \
		-e TF_VAR_FILE="$(TF_VAR_FILE)" \
		--network host \
		--entrypoint "/our/terraform/run.sh" \
		$(terraform_docker)
