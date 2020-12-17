.PHONY: terraform-version
terraform-version: require-terraform
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		--network host \
		--entrypoint "" \
		$(terraform_docker) \
		terraform --version
