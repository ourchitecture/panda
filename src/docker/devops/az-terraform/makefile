docker_tag=ourchitecture/devops-az-terraform:local
docker_name=our-devops-az-terraform

install:
	@docker build -t $(docker_tag) .

start:
	@docker run --rm -it \
		--name $(docker_name) \
		--network host \
		$(docker_tag) \
		/bin/bash

stop:
	@docker stop $(docker_name)

uninstall:
	@docker rm -f $(docker_name)
	@docker rmi -f $(docker_tag)
