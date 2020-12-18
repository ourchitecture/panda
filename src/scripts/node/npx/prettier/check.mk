.PHONY: prettier-check
prettier-check: require-root require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		$(node_docker) \
		npx prettier --check --ignore-unknown .
