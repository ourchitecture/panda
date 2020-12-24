node_docker_name_prefix=our-scripts-node-make-$(now_date_time_tag)

node_docker=ourchitecture/devops-node:latest

.PHONY: require-node
require-node:
ifndef node_docker_name_prefix
	$(error node_docker_name_prefix is not set)
endif
ifndef node_docker
	$(error node_docker is not set)
endif
