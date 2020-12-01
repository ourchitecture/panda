include ../../../../../root.mk

app_docker_name=our-tutorials-node-azure

APP_PORT=3000
HOST_PORT=3000

# tutorials base
include $(src_dir_path)/tutorials/common.mk

# yarn cli
include $(scripts_dir_path)/node/yarn/common.mk

# azure cli
include $(scripts_dir_path)/azure/common.mk

.PHONY: install
install: deploy-webapp

.PHONY: uninstall
uninstall: delete-webapp
