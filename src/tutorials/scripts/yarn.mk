init:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		yarn
