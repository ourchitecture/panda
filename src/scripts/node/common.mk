
# https://hub.docker.com/_/node/?tab=tags
docker_node=node:lts-alpine3.11

node_docker_name_prefix=our-scripts-node-make-$(now_date_time_tag)

.PHONY: node-required-vars
node-required-vars:
ifndef node_docker_name_prefix
	$(error node_docker_name_prefix is not set)
endif
ifndef scripts_dir_path
	$(error scripts_dir_path is not set)
endif
ifndef my_dir_path
	$(error my_dir_path is not set)
endif
ifndef docker_node
	$(error docker_node is not set)
endif

.PHONY: node-version
node-version: node-required-vars
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_node) \
		/our/node/version.sh

.PHONY: clean
clean: node-required-vars
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_node) \
		rm -rf node_modules .azure package-lock.json
