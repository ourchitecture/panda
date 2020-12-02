include ../../../../root.mk

# yarn cli
include $(scripts_dir_path)/node/yarn/common.mk

.PHONY: format
format:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		yarn prettier --write --ignore-unknown .

.PHONY: lint
lint: node-required-vars
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		yarn prettier --check --ignore-unknown .

.PHONY: test
test: node-required-vars
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_node) \
		yarn nyc --extension .ts mocha --forbid-only "test/**/*.test.ts"

.PHONY: check
check: lint test

.PHONY: readme
readme: node-required-vars
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_node) \
		yarn oclif-dev readme

install:
	docker build -t our-oclif-cli .

uninstall:
	docker rmi -f our-oclif-cli
