DEBUG?=false

ENV_FILE?=""
ifeq ($(ENV_FILE),"")
docker_arg_env_file=
else
docker_arg_env_file= --env-file="$(ENV_FILE)"
endif

APP_PORT?=""
HOST_PORT?=""
ifeq ($(APP_PORT),"")
docker_arg_port=
else
docker_arg_port= -p $(HOST_PORT):$(APP_PORT)
endif

# although empty, this ensures this docker makefile is loaded
.PHONY: require-docker
require-docker: ;
