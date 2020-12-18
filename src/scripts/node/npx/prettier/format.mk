.PHONY: prettier-format
prettier-format: require-root require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		$(node_docker) \
		npx prettier --write --ignore-unknown .
