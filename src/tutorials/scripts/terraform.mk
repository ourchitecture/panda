# https://hub.docker.com/r/zenika/terraform-azure-cli/tags
docker_az_terraform=zenika/terraform-azure-cli:release-5.0_terraform-0.13.5_azcli-2.13.0

# test the terraform scripts
# note: "Error 3" likely indicates a `terraform fmt` error
#       To fix, run `terraform fmt -recursive` and re-check.
test:
ifndef scripts_relative_dir
	$(error scripts_relative_dir not set)
endif
ifndef linux_scripts_path
	$(error linux_scripts_path not set)
endif
	@docker run --rm -t \
		--name our-terraform-make-test \
		-v $(shell pwd)/$(scripts_relative_dir):$(linux_scripts_path) \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_az_terraform) \
		$(linux_scripts_path)/terraform/test.sh

plan-create:
ifndef scripts_relative_dir
	$(error scripts_relative_dir not set)
endif
ifndef linux_scripts_path
	$(error linux_scripts_path not set)
endif
	@docker run --rm -t \
		--name our-terraform-make-plan-create \
		-v $(shell pwd)/$(scripts_relative_dir):$(linux_scripts_path) \
		-v $(shell pwd):/app \
		-w /app \
		-e TERRAFORM_VAR_FILE_PATH=$(var-file) \
		$(docker_az_terraform) \
		$(linux_scripts_path)/terraform/azure/create.sh

create:
ifndef scripts_relative_dir
	$(error scripts_relative_dir not set)
endif
ifndef linux_scripts_path
	$(error linux_scripts_path not set)
endif
	@docker run --rm -t \
		--name our-terraform-make-create \
		-v $(shell pwd)/$(scripts_relative_dir):$(linux_scripts_path) \
		-v $(shell pwd):/app \
		-w /app \
		-e TERRAFORM_VAR_FILE_PATH=$(var-file) \
		-e TF_APPLY="true" \
		$(docker_az_terraform) \
		$(linux_scripts_path)/terraform/azure/create.sh

plan-destroy:
ifndef scripts_relative_dir
	$(error scripts_relative_dir not set)
endif
ifndef linux_scripts_path
	$(error linux_scripts_path not set)
endif
	@docker run --rm -t \
		--name our-terraform-make-plan-destroy \
		-v $(shell pwd)/$(scripts_relative_dir):$(linux_scripts_path) \
		-v $(shell pwd):/app \
		-w /app \
		-e TERRAFORM_VAR_FILE_PATH=$(var-file) \
		$(docker_az_terraform) \
		$(linux_scripts_path)/terraform/azure/destroy.sh

destroy:
ifndef scripts_relative_dir
	$(error scripts_relative_dir not set)
endif
ifndef linux_scripts_path
	$(error linux_scripts_path not set)
endif
	@docker run --rm -t \
		--name our-terraform-make-destroy \
		-v $(shell pwd)/$(scripts_relative_dir):$(linux_scripts_path) \
		-v $(shell pwd):/app \
		-w /app \
		-e TERRAFORM_VAR_FILE_PATH=$(var-file) \
		-e TF_APPLY="true" \
		$(docker_az_terraform) \
		$(linux_scripts_path)/terraform/azure/destroy.sh

clean-terraform:
ifndef scripts_relative_dir
	$(error scripts_relative_dir not set)
endif
ifndef linux_scripts_path
	$(error linux_scripts_path not set)
endif
	@docker run --rm -t \
		--name our-terraform-make-clean \
		-v $(shell pwd)/$(scripts_relative_dir):$(linux_scripts_path) \
		-v $(shell pwd):/app \
		-w /app \
		$(docker_az_terraform) \
		$(linux_scripts_path)/terraform/clean.sh
