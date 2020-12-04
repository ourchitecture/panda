azure_docker=microsoft/azure-cli:latest
azure_docker_name_prefix=our-scripts-azure-make-$(now_date_time_tag)

ARM_RESOURCE_GROUP?=""

.PHONY: require-azure
require-azure:
ifndef azure_docker
	$(error azure_docker is not set)
endif
ifndef azure_docker_name_prefix
	$(error azure_docker_name_prefix is not set)
endif
