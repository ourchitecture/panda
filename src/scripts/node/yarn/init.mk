.PHONY: yarn-init
yarn-init: require-root require-node
ifdef YARN_REGISTRY_URL
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		$(node_docker) \
		yarn --registry "$(YARN_REGISTRY_URL)"
else
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		$(node_docker) \
		yarn
endif
