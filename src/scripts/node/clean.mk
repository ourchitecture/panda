.PHONY: node-clean
node-clean: require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		$(node_docker) \
		rm -rf node_modules .azure package-lock.json
