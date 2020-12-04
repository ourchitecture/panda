.PHONY: yarn-version
yarn-version: require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		$(node_docker) \
		yarn --version
