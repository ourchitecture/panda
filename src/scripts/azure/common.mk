# https://hub.docker.com/r/microsoft/azure-cli/tags
docker_az=microsoft/azure-cli:latest

azure_docker_name_prefix=our-scripts-azure-make

.PHONY: az-required-vars
az-required-vars:
ifndef docker_az
	$(error docker_az is not set)
endif
ifndef azure_docker_name_prefix
	$(error azure_docker_name_prefix is not set)
endif

list-resource-groups: az-required-vars
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		$(docker_az) \
		/bin/bash -c 'az login --allow-no-subscriptions > /dev/null && az group list -o table'

list-storage-accounts: az-required-vars
ifndef resource-group
	$(error resource-group not set)
endif
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		$(docker_az) \
		/bin/bash -c 'az login --allow-no-subscriptions > /dev/null && az storage account list -g "$(resource-group)" --query "[].{name:name, tier:sku.tier}" -o table'
