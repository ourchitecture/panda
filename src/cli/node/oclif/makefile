include ../../../../.vars.mk

include $(scripts_dir_path)/prerequisites.mk

include $(scripts_dir_path)/docker/.vars.mk

include $(scripts_dir_path)/node/.vars.mk

include $(scripts_dir_path)/node/yarn/init.mk
include $(scripts_dir_path)/node/yarn/prettier/format.mk
include $(scripts_dir_path)/node/yarn/prettier/check.mk

.DEFAULT_GOAL := all

.PHONY: all
all: check

.PHONY: init
check: yarn-init

.PHONY: nyc-check
nyc-check: require-root require-node init
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		$(node_docker) \
		yarn nyc --extension .ts mocha --forbid-only "test/**/*.test.ts"

.PHONY: check
check: init prettier-check nyc-check

.PHONY: readme
readme: require-root require-node init
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		$(node_docker) \
		yarn oclif-dev readme

.PHONY: install
install: init
	docker build -t our-panda-cli .

.PHONY: uninstall
uninstall: init
	docker rmi -f our-panda-cli
