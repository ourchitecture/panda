docker_node=node:lts-alpine3.11
docker_commitlint=ourchitecture/git-commitlint

init:
	@docker run --rm -t -v $(shell pwd):/app -w /app $(docker_node) yarn

commitlint:
	@docker run --rm -t -v $(shell pwd):/app -w /app $(docker_commitlint) commitlint --from HEAD~${commit-count} --to HEAD

test:
	@docker run --rm -t -v $(shell pwd):/app -w /app $(docker_node) yarn test
