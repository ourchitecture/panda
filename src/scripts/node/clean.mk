.PHONY: node-clean
node-clean: require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		$(node_docker) \
		rm -rf node_modules .azure package-lock.json .nyc_output
