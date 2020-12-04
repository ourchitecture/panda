include ./.vars.mk

include $(scripts_dir_path)/prerequisites.mk

include $(scripts_dir_path)/terraform/.vars.mk
include $(scripts_dir_path)/terraform/check.mk
include $(scripts_dir_path)/terraform/format.mk

include $(scripts_dir_path)/node/.vars.mk
include $(scripts_dir_path)/node/clean.mk
include $(scripts_dir_path)/node/commitlint/check.mk
include $(scripts_dir_path)/node/yarn/init.mk
include $(scripts_dir_path)/node/yarn/prettier/check.mk
include $(scripts_dir_path)/node/yarn/prettier/format.mk
include $(scripts_dir_path)/node/yarn/jest/check.mk
include $(scripts_dir_path)/node/yarn/commit/commit.mk

.DEFAULT_GOAL := all

.PHONY: all
all: init format check

.PHONY: init
init: yarn-init

.PHONY: format
format: prettier-format terraform-format

.PHONY: check
check: prettier-check terraform-check jest-check

.PHONY: commit
commit: yarn-commit

.PHONY: clean
clean: node-clean
