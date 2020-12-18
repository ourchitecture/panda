.PHONY: node-install
node-install: require-root require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		--network host \
		$(node_docker) \
		npm install
