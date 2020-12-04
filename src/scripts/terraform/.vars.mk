terraform_docker_name_prefix=our-scripts-terraform-make-$(now_date_time_tag)

# can be overridden
terraform_docker?=hashicorp/terraform:0.14.0

.PHONY: require-terraform
require-terraform:
ifndef terraform_docker_name_prefix
	$(error terraform_docker_name_prefix is not set)
endif
ifndef terraform_docker
	$(error terraform_docker is not set)
endif
