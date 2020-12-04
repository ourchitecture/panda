commit_docker=ourchitecture/devops-az-node

.PHONY: yarn-commit
yarn-commit: require-root require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		$(commit_docker) \
		yarn commit
