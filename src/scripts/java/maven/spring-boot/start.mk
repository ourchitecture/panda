# define a static docker name without a date/time stamp
# (this can be overridden by the app's makefile)
app_docker_name?=our-scripts-spring-boot-app-make

.PHONY: spring-boot-start
spring-boot-start: require-root require-java require-docker
	@docker run -d \
		--name $(app_docker_name) \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_port) \
		$(docker_arg_env_file) \
		-e APP_PORT=$(APP_PORT) \
		-e HOST_PORT=$(HOST_PORT) \
		-e SERVER_PORT=$(APP_PORT) \
		-e SERVER_ADDRESS=0.0.0.0 \
		--entrypoint "/our/java/maven/spring-boot/start.sh" \
		$(java_docker) \
	&& echo Docker image \"$(app_docker_name)\" started at http://localhost:$(HOST_PORT) \
	&& echo NOTE: This could take several seconds to minutes to start... \
	&& echo Use \"make logs\" to check the logs for status
