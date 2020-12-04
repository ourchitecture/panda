.PHONY: azure-app-service-plans-list
azure-app-service-plans-list: require-root require-docker require-azure
ifeq ($(ARM_RESOURCE_GROUP),"")
	$(error ARM_RESOURCE_GROUP not set)
endif
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-e DEBUG=$(DEBUG) \
		-e ARM_RESOURCE_GROUP=$(ARM_RESOURCE_GROUP) \
		$(docker_arg_env_file) \
		$(azure_docker) \
		/our/azure/app-service-plans/list.sh
