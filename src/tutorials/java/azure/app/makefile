include ../../../../../.vars.mk

APP_PORT?=8080
HOST_PORT?=3000

include $(scripts_dir_path)/prerequisites.mk

include $(scripts_dir_path)/docker/.vars.mk

include $(scripts_dir_path)/java/.vars.mk
include $(scripts_dir_path)/java/version.mk
include $(scripts_dir_path)/java/maven/version.mk
include $(scripts_dir_path)/java/maven/check.mk
include $(scripts_dir_path)/java/maven/install.mk
include $(scripts_dir_path)/java/maven/spring-boot/start.mk
include $(scripts_dir_path)/java/maven/spring-boot/logs.mk
include $(scripts_dir_path)/java/maven/spring-boot/stop.mk

include $(scripts_dir_path)/azure/.vars.mk
include $(scripts_dir_path)/azure/app-service-plans/list.mk
include $(scripts_dir_path)/azure/webapps/list.mk
include $(scripts_dir_path)/azure/webapps/java/maven/install.mk
include $(scripts_dir_path)/azure/webapps/uninstall.mk

.DEFAULT_GOAL := all

.PHONY: all
all: check

.PHONY: version
version: java-version maven-version

.PHONY: check
check: maven-check

.PHONY: install
install: azure-webapps-java-install

.PHONY: start
start: spring-boot-start

.PHONY: logs
logs: spring-boot-logs

.PHONY: stop
stop: spring-boot-stop
