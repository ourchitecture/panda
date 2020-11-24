# https://hub.docker.com/r/microsoft/azure-cli/tags
docker_az=microsoft/azure-cli:latest

rg-name=our-tutorials-rg

list-resource-groups:
ifndef docker_name_prefix
	$(error docker_name_prefix not set)
endif
	@docker run --rm -t \
		--name $(docker_name_prefix)-list-locations \
		$(docker_az) \
		/bin/bash -c 'az login --allow-no-subscriptions > /dev/null && az group list -o table'

list-plans:
ifndef docker_name_prefix
	$(error docker_name_prefix not set)
endif
	@docker run --rm -t \
		--name $(docker_name_prefix)-list-locations \
		$(docker_az) \
		/bin/bash -c 'az login --allow-no-subscriptions > /dev/null && az appservice plan list -g $(rg-name) --query "[].{name:name, kind:kind, status:status, tier:sku.tier, size:sku.size}" -o table'
