.PHONY: java-version
java-version: require-root require-java
	@docker run --rm -t \
		--name $(java_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		--network host \
		$(java_docker) \
		java -version
