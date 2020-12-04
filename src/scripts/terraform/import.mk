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
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		--entrypoint "" \
		$(terraform_docker) \
		terraform import $(RESOURCE_ADDRESS) $(RESOURCE_ID)
