.PHONY: terraform-clean
terraform-clean: require-root require-terraform
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		--entrypoint "" \
		$(terraform_docker) \
		/bin/sh -c "rm -rf .terraform *.tfplan *.tfstate *.tfstate.backup .terraform.tfstate.lock.info .tfstate.lock.hcl"
