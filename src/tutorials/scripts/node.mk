docker_node=node:lts-alpine3.11

clean-node:
ifndef scripts_relative_dir
	$(error scripts_relative_dir not set)
endif
ifndef linux_scripts_path
	$(error linux_scripts_path not set)
endif
	@docker run --rm -t \
		--name our-node-make-clean \
		-v $(shell pwd)/$(scripts_relative_dir):$(linux_scripts_path) \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		$(linux_scripts_path)/node/clean.sh
