.PHONY: prettier-format
prettier-format: require-root require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		$(node_docker) \
		yarn prettier --write --ignore-unknown .
