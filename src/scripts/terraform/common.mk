# Dependencies:
# - ../../../root.mk
# - ../docker/common.mk

terraform_docker_name_prefix=our-scripts-terraform-make-$(now_date_time_tag)

docker_az_terraform=ourchitecture/devops-az-terraform
tf_run_script_path?=/our/terraform/run.sh

DEBUG?=false

TF_PLAN_ONLY?=false
TF_VAR_FILE?=""

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
		$(docker_arg_env_file) \
		$(docker_az_terraform) \
		terraform init

.PHONY: format
format: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_az_terraform) \
		terraform fmt -recursive

.PHONY: check
check: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_az_terraform) \
		/our/terraform/check.sh

.PHONY: clean
clean: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		$(docker_az_terraform) \
		rm -rf .terraform *.tfplan *.tfstate *.tfstate.backup *.tfstate.lock.info

.PHONY: install
install: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		-e TF_PLAN_ONLY=$(TF_PLAN_ONLY) \
		-e TF_VAR_FILE="$(TF_VAR_FILE)" \
		$(docker_az_terraform) \
		$(tf_run_script_path)

.PHONY: uninstall
uninstall: tf-required-vars
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(scripts_dir_path):/our \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		-e TF_PLAN_ONLY=$(TF_PLAN_ONLY) \
		-e TF_DESTROY=true \
		-e TF_VAR_FILE="$(TF_VAR_FILE)" \
		$(docker_az_terraform) \
		$(tf_run_script_path)

.PHONY: import
import: tf-required-vars
ifndef file-resource-name
	$(error file-resource-name is not set)
endif
ifndef resource-id
	$(error resource-id is not set)
endif
	@docker run --rm -t \
		--name $(terraform_docker_name_prefix)-$@ \
		-v $(my_dir_path):/app \
		-w /app \
		$(docker_arg_env_file) \
		-e DEBUG=$(DEBUG) \
		$(docker_az_terraform) \
		terraform import $(file-resource-name) $(resource-id)
