.PHONY: terraform-init
terraform-init: require-root require-terraform
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		--entrypoint "" \
		$(terraform_docker) \
		terraform init
