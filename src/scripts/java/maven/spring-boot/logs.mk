# define a static docker name without a date/time stamp
# (this can be overridden by the app's makefile)
app_docker_name?=our-scripts-spring-boot-app-make

.PHONY: spring-boot-logs
spring-boot-logs:
	@docker logs $(app_docker_name)
