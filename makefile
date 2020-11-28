docker_node=node:lts-alpine3.11
docker_commitlint=ourchitecture/git-commitlint

# the prefix to use on running docker containers
docker_name_prefix=our-patterns-tutorials

# the relative path to "./src/tutorials/scripts"
scripts_relative_dir=./src/tutorials/scripts/

include $(scripts_relative_dir)node.mk
include $(scripts_relative_dir)yarn.mk

all: init commitlint lint test

.PHONY: commitlint
commitlint:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_commitlint) \
		commitlint --from HEAD~${commit-count} --to HEAD

.PHONY: lint
lint:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		yarn prettier --check --ignore-unknown .

.PHONY: test
test:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		yarn jest

check: commitlint lint test

.PHONY: commit
commit:
	@yarn commit

.PHONY: commit-all
commit-all:
	@git add .
	@yarn commit

.PHONY: git-commit-all
git-commit-all:
	@git add .
	@git commit -m "${m}"

.PHONY: sync
sync:
	# git-town sync
	@git sync

.PHONY: pr-feat
pr-feat:
	@gh pr create -l enhancement -f -w

.PHONY: pr-bug
pr-bug:
	@gh pr create -l bug -f -w
