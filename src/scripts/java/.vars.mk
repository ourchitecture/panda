java_docker_name_prefix=our-scripts-java-make-$(now_date_time_tag)

java_docker=openjdk:11

.PHONY: require-java
require-java:
ifndef java_docker_name_prefix
	$(error java_docker_name_prefix is not set)
endif
ifndef java_docker
	$(error java_docker is not set)
endif
