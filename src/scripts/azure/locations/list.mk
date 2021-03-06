.PHONY: azure-locations-list
azure-locations-list: require-root require-docker require-azure
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-e DEBUG=$(DEBUG) \
		$(docker_arg_env_file) \
		--network host \
		$(azure_docker) \
		/our/azure/locations/list.sh
