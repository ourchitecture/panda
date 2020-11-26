# dependencies: root.mk

docker_az_terraform=ourchitecture/devops-az-terraform

hi:
	@echo "Hello"

test: root
ifdef OUR_SAFETY
	ls -l
	# @/our-scripts/terraform/test.sh
else
	docker run --rm -t \
		--name $(docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our-scripts \
		-v $(shell pwd):/app \
		-w /app \
		-e OUR_SAFETY=true \
		$(docker_az_terraform) \
		make hi
endif
