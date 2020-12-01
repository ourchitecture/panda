# Dependencies:
# - ../../../root.mk
# - ../docker/common.mk

# https://hub.docker.com/r/microsoft/azure-cli/tags
docker_az=microsoft/azure-cli:latest

azure_docker_name_prefix=our-scripts-azure-make-$(now_date_time_tag)

ARM_RESOURCE_GROUP?=""

.PHONY: az-required-vars
az-required-vars:
ifndef scripts_dir_path
	$(error scripts_dir_path is not set)
endif
ifndef docker_az
	$(error docker_az is not set)
endif
ifndef azure_docker_name_prefix
	$(error azure_docker_name_prefix is not set)
endif

.PHONY: list-resource-groups
list-resource-groups: az-required-vars
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-e DEBUG=$(DEBUG) \
		$(docker_arg_env_file) \
		$(docker_az) \
		/our/azure/list-resource-groups.sh

.PHONY: list-storage-accounts
list-storage-accounts: az-required-vars
ifeq ($(ARM_RESOURCE_GROUP),"")
	$(error ARM_RESOURCE_GROUP not set)
endif
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		-e ARM_RESOURCE_GROUP=$(ARM_RESOURCE_GROUP) \
		$(docker_az) \
		/our/azure/list-plans.sh

.PHONY: list-appservice-plans
list-appservice-plans: az-required-vars
ifeq ($(ARM_RESOURCE_GROUP),"")
	$(error ARM_RESOURCE_GROUP not set)
endif
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		-e ARM_RESOURCE_GROUP=$(ARM_RESOURCE_GROUP) \
		$(docker_az) \
		/our/azure/list-appservice-plans.sh

.PHONY: list-webapps
list-webapps: az-required-vars
ifeq ($(ARM_RESOURCE_GROUP),"")
	$(error ARM_RESOURCE_GROUP not set)
endif
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		-e ARM_RESOURCE_GROUP=$(ARM_RESOURCE_GROUP) \
		$(docker_az) \
		/our/azure/list-webapps.sh

.PHONY: deploy-webapp
deploy-webapp: az-required-vars
ifeq ($(ENV_FILE),"")
	$(error ENV_FILE not set)
endif
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		$(docker_az) \
		/our/azure/deploy-webapp.sh

.PHONY: delete-webapp
delete-webapp: az-required-vars
ifeq ($(ENV_FILE),"")
	$(error ENV_FILE not set)
endif
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		$(docker_az) \
		/our/azure/delete-webapp.sh
