# Dependencies:
# - ../../../root.mk

docker_az_terraform=ourchitecture/devops-az-terraform
terraform_docker_name_prefix=our-scripts-terraform-make

all: init

.PHONY: tf-required-vars
tf-required-vars:
ifndef terraform_docker_name_prefix
	$(error terraform_docker_name_prefix is not set)
endif
ifndef scripts_dir_path
	$(error scripts_dir_path is not set)
endif
ifndef my_dir_path
	$(error my_dir_path is not set)
endif
ifndef docker_az_terraform
	$(error docker_az_terraform is not set)
endif

.PHONY: init
init: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		terraform init

.PHONY: format
format: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		terraform fmt -recursive

.PHONY: check
check: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		/our/terraform/check.sh

.PHONY: clean
clean: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_az_terraform) \
		rm -rf .terraform *.tfplan *.tfstate *.tfstate.backup *.tfstate.lock.info
