# define a static docker name without a date/time stamp
# (this can be overridden by the app's makefile)
app_docker_name?=our-scripts-yarn-app-make

.PHONY: yarn-start
yarn-start: require-root require-node require-docker
	@set -e \
	&& docker run -d \
		--name $(app_docker_name) \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_arg_port) \
		$(node_docker) \
		yarn start \
	&& echo Docker image \"$(app_docker_name)\" started at http://localhost:$(HOST_PORT)
