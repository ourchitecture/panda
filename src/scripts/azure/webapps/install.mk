.PHONY: azure-webapps-install
azure-webapps-install: require-root require-docker require-azure
ifeq ($(ENV_FILE),"")
	$(error ENV_FILE not set)
endif
	@docker run --rm -t \
		--name $(azure_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e DEBUG=$(DEBUG) \
		$(docker_arg_env_file) \
		--network host \
		$(azure_docker) \
		/our/azure/webapps/install.sh
