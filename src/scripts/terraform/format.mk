.PHONY: terraform-format
terraform-format: require-root require-terraform
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		--entrypoint "" \
		$(terraform_docker) \
		terraform fmt -recursive
