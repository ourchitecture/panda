.PHONY: node-version
node-version: require-root require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		--network host \
		--entrypoint "/our/node/version.sh" \
		$(node_docker)
