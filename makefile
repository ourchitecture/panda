include ./.vars.mk

include $(scripts_dir_path)/prerequisites.mk

include $(scripts_dir_path)/terraform/.vars.mk
include $(scripts_dir_path)/terraform/check.mk
include $(scripts_dir_path)/terraform/format.mk

include $(scripts_dir_path)/node/.vars.mk
include $(scripts_dir_path)/node/clean.mk
include $(scripts_dir_path)/node/interactive.mk
include $(scripts_dir_path)/node/commitlint/check.mk
include $(scripts_dir_path)/node/yarn/install.mk
include $(scripts_dir_path)/node/yarn/prettier/check.mk
include $(scripts_dir_path)/node/yarn/prettier/format.mk
include $(scripts_dir_path)/node/yarn/jest/check.mk
include $(scripts_dir_path)/node/yarn/commit/commit.mk

.DEFAULT_GOAL := all

.PHONY: all
all: init format check

.PHONY: init
init: yarn-install

.PHONY: format
format: init prettier-format terraform-format

.PHONY: check
check: init prettier-check terraform-check jest-check

.PHONY: commit
commit: init yarn-commit

.PHONY: clean
clean: node-clean

.PHONY: pr-feat
pr-feat:
	@gh pr create -l enhancement -f -w

.PHONY: pr-bug
pr-bug:
	@gh pr create -l bug -f -w
