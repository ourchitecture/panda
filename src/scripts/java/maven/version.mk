.PHONY: maven-version
maven-version: require-root require-java
	@docker run --rm -t \
		--name $(java_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		--network host \
		--entrypoint "/our/java/maven/version.sh" \
		$(java_docker)
