.PHONY: yarn-version
yarn-version: require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		--network host \
		$(node_docker) \
		yarn --version
