# Dependencies:
# - ../../../../root.mk
# - ../docker.mk

azure_terraform_docker_name_prefix=our-scripts-terraform-azure-make

create:
	@docker run --rm -t \
		--name $(azure_terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		/our/terraform/azure/create.sh
