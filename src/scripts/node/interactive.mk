.PHONY: node-interactive
node-interactive: require-node
	@docker run --rm -it \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		--entrypoint "" \
		$(node_docker) \
		/bin/bash
