docker_node=node:lts-alpine3.11
docker_az_node=docker.pkg.github.com/ourchitecture/patterns-and-tutorials/devops-az-node:latest

# the prefix to use on running docker containers
docker_name_prefix=our-node-hello-azure

# the relative path to "./src/tutorials/scripts"
scripts_relative_dir=../scripts/

port=3000
rg-name=our-patterns-tutorials-rg
plan-name=our-tutorial-apps
plan-os=Linux
plan-location=East US
app-sku=Free
name=our-node-hello-azure

include ../scripts/docker.mk
include ../scripts/azure.mk
include ../scripts/node.mk
include ../scripts/yarn.mk

all: init

clean: clean-node

start:
	@set -e && \
	docker run -d \
		--name $(docker_name_prefix)-make-start \
		-v $(shell pwd):/app \
		-w /app \
		-p $(port):3000 \
		$(docker_node) \
		yarn start && \
	echo Started at http://localhost:$(port)

stop: clean-docker

deploy:
	docker run --rm -t \
		--name $(docker_name_prefix)-make-deploy \
		-v $(shell pwd)/$(scripts_relative_dir):$(linux_scripts_path) \
		-v $(shell pwd):/app \
		-w /app \
		--env-file .env \
		-e ARM_RESOURCE_GROUP="$(rg-name)" \
		-e APP_SERVICE_PLAN_NAME="$(plan-name)" \
		-e APP_SERVICE_PLAN_OS="$(plan-os)" \
		-e APP_SERVICE_PLAN_LOCATION="$(plan-location)" \
		-e APP_NAME="$(name)" \
		-e APP_SKU="$(app-sku)" \
		$(docker_az_node) \
		./deploy.sh
