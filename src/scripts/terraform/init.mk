DEBUG?=false

.PHONY: terraform-init
terraform-init: require-root require-terraform
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e DEBUG=$(DEBUG) \
		$(docker_arg_env_file) \
		--network host \
		--entrypoint "/our/terraform/init.sh" \
		$(terraform_docker)
