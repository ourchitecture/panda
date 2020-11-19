docker_node=node:lts-alpine3.11
docker_commitlint=ourchitecture/git-commitlint

all: init commitlint lint test

init:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		yarn

commitlint:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_commitlint) \
		commitlint --from HEAD~${commit-count} --to HEAD

lint:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		yarn prettier --check --ignore-unknown .

test:
	@docker run --rm -t \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_node) \
		yarn jest

new-pr-feat:
	gh pr create -l enhancement -f -w

new-pr-bug:
	gh pr create -l bug -f -w
