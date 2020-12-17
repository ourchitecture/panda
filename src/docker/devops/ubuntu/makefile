docker_name=our-devops-ubuntu

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
