docker_node=node:lts-alpine3.11

init:
	docker run --rm -v $(shell pwd):/app -w /app $(docker_node) yarn

test:
	docker run --rm -v $(shell pwd):/app -w /app $(docker_node) yarn test
