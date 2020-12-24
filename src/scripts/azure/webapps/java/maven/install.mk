azure_java_docker=ourchitecture/devops-az-java:latest
azure_java_docker_name_prefix=our-scripts-azure-java-make-$(now_date_time_tag)

.PHONY: azure-webapps-java-install
azure-webapps-java-install: require-root require-docker require-azure
ifeq ($(ENV_FILE),"")
	$(error ENV_FILE not set)
endif
	@docker run --rm -t \
		--name $(azure_java_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		-e DEBUG=$(DEBUG) \
		$(docker_arg_env_file) \
		--network host \
		--entrypoint "/our/azure/webapps/java/maven/install.sh" \
		$(azure_java_docker)
