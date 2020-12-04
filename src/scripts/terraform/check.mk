.PHONY: terraform-check
terraform-check: require-root require-terraform
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		--entrypoint "/our/terraform/check.sh" \
		$(terraform_docker)
