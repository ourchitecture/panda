include ../../../../../../root.mk

include $(scripts_dir_path)/terraform/docker.mk
include $(scripts_dir_path)/terraform/azure/docker.mk

plan-create:
ifndef resource-group
	$(error resource-group is not set)
endif
ifndef location
	$(error location is not set)
endif
	@docker run --rm -t \
		--name $(docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		/our/terraform/azure/plan.sh \
			'-var="rg_name=$(resource-group)" -var="rg_location=$(location)"'
