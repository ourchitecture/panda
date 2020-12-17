docker_name=our-devops-az-terraform

install:
	@docker build -t $(docker_name) .

start:
	@docker run --rm -it \
		--name $(docker_name) \
		--network host \
		$(docker_name) \
		/bin/bash

stop:
	@docker stop $(docker_name)

uninstall:
	@docker rm -f $(docker_name)
	@docker rmi -f $(docker_name)
