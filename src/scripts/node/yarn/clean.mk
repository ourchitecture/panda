.PHONY: yarn-clean
yarn-clean: node-clean
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		$(node_docker) \
		rm -rf .pnp.js .yarn/install-state.gz .yarn/cache
