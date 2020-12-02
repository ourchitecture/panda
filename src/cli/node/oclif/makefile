include ../../../../root.mk

# yarn cli
include $(scripts_dir_path)/node/yarn/common.mk

.PHONY: check
check: node-required-vars
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_node) \
		yarn test

install:
	docker build -t our-oclif-cli .

uninstall:
	docker rmi -f our-oclif-cli
