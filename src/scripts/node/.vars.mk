
node_docker_name_prefix=our-scripts-node-make-$(now_date_time_tag)

# https://hub.docker.com/_/node/?tab=tags
node_docker=node:lts-alpine3.11

.PHONY: require-node
require-node:
ifndef node_docker_name_prefix
	$(error node_docker_name_prefix is not set)
endif
ifndef node_docker
	$(error node_docker is not set)
endif
