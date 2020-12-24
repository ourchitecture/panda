include ../../../../../.vars.mk

APP_PORT=3000
HOST_PORT=3000
ENV_FILE?=.env

include $(scripts_dir_path)/prerequisites.mk

include $(scripts_dir_path)/docker/.vars.mk

include $(scripts_dir_path)/node/.vars.mk
include $(scripts_dir_path)/node/clean.mk

include $(scripts_dir_path)/node/yarn/install.mk
include $(scripts_dir_path)/node/yarn/start.mk
include $(scripts_dir_path)/node/yarn/stop.mk
include $(scripts_dir_path)/node/yarn/clean.mk

include $(scripts_dir_path)/azure/.vars.mk
include $(scripts_dir_path)/azure/app-service-plans/list.mk
include $(scripts_dir_path)/azure/webapps/list.mk
include $(scripts_dir_path)/azure/webapps/node/install.mk
include $(scripts_dir_path)/azure/webapps/uninstall.mk

.DEFAULT_GOAL := all

.PHONY: all
all: check

.PHONY: init
init: yarn-install

.PHONY: check
check: init

.PHONY: clean
clean: yarn-clean
	@rm -f app.deploy.zip

.PHONY: start
start: yarn-start

.PHONY: stop
stop: yarn-stop

.PHONY: install
install: check azure-webapps-node-install

.PHONY: uninstall
uninstall: azure-webapps-uninstall
