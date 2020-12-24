commit_docker=ourchitecture/devops-node

.PHONY: yarn-commit
yarn-commit: require-root require-node
	@docker run --rm -t \
		--name $(node_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		$(commit_docker) \
		yarn commit
