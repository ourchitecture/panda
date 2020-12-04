# define a static docker name without a date/time stamp
# (this can be overridden by the app's makefile)
app_docker_name?=our-scripts-yarn-app-make

.PHONY: yarn-stop
yarn-stop:
	@set -e \
	&& docker rm -f $(app_docker_name) \
	&& echo Docker image \"$(app_docker_name)\" stopped and removed
