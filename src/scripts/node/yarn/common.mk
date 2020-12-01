# Dependencies:
# - ../common.mk

yarn_docker_name_prefix=our-scripts-yarn-make-$(now_date_time_tag)

# define a static docker name without a date/time stamp
# (this can be overridden by the app's makefile)
app_docker_name?=our-scripts-yarn-app-make

# node cli
include $(scripts_dir_path)/node/common.mk

.PHONY: init
init:
	@docker run --rm -t \
		--name $(yarn_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_node) \
		yarn

.PHONY: start
start:
ifndef HOST_PORT
	$(error HOST_PORT is not set)
endif
ifndef APP_PORT
	$(error APP_PORT is not set)
endif
	@set -e \
	&& docker run -d \
		--name $(app_docker_name) \
		-v $(scripts_dir_path):/our \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_arg_port) \
		$(docker_node) \
		yarn start \
	&& echo Docker image \"$(app_docker_name)\" started at http://localhost:$(HOST_PORT)

.PHONY: stop
stop:
	@set -e \
	&& docker rm -f $(app_docker_name) \
	&& echo Docker image \"$(app_docker_name)\" stopped and removed
