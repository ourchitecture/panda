include ../../../../../.vars.mk

APP_PORT=3000
HOST_PORT=3000

include $(scripts_dir_path)/prerequisites.mk

include $(scripts_dir_path)/docker/.vars.mk

include $(scripts_dir_path)/node/.vars.mk
include $(scripts_dir_path)/node/yarn/install.mk
include $(scripts_dir_path)/node/yarn/start.mk
include $(scripts_dir_path)/node/yarn/stop.mk

include $(scripts_dir_path)/azure/.vars.mk
include $(scripts_dir_path)/azure/app-service-plans/list.mk
include $(scripts_dir_path)/azure/webapps/list.mk
include $(scripts_dir_path)/azure/webapps/install.mk
include $(scripts_dir_path)/azure/webapps/uninstall.mk

.DEFAULT_GOAL := all

.PHONY: all
all: init

.PHONY: init
init: yarn-install

.PHONY: start
start: yarn-start

.PHONY: stop
stop: yarn-stop

.PHONY: install
install: azure-webapps-install

.PHONY: uninstall
uninstall: azure-webapps-uninstall
