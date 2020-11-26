linux_scripts_path=/usr/local/bin/our-scripts

docker-stop:
	@docker stop $(docker_name_prefix)-$(name)

clean-docker:
	@set -e && \
	docker rm -f $(name) && \
	echo Application was stopped and removed.
