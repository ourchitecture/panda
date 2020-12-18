include ../../../../.vars.mk

include $(scripts_dir_path)/prerequisites.mk

include $(scripts_dir_path)/docker/.vars.mk

include $(scripts_dir_path)/node/.vars.mk
include $(scripts_dir_path)/node/clean.mk
include $(scripts_dir_path)/node/interactive.mk
include $(scripts_dir_path)/node/install.mk

include $(scripts_dir_path)/node/npx/prettier/format.mk
include $(scripts_dir_path)/node/npx/prettier/check.mk

.DEFAULT_GOAL := run

.PHONY: all
all: check

.PHONY: init
init: node-install

.PHONY: clean
clean: node-install

.PHONY: nyc-check
nyc-check: require-root require-node init
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		$(node_docker) \
		npx nyc --extension .ts mocha --forbid-only "test/**/*.test.ts"

.PHONY: check
check: init prettier-check nyc-check

.PHONY: readme
readme: require-root require-node init
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		$(node_docker) \
		yarn oclif-dev readme

.PHONY: install
install: init
	docker build --network="host" -t ourchitecture/our-cli:local .

cmd?=help

.PHONY: run
run:
ifndef cmd
	$(error cmd is not set)
endif
	@docker run --rm \
		--network host \
		-t ourchitecture/our-cli:local \
		$(cmd)

.PHONY: uninstall
uninstall: init
	docker rmi -f \
		ourchitecture/our-cli:local
