# override terraform vars
terraform_docker=ourchitecture/devops-az-terraform
tf_import_script_path=/our/terraform/azure/import.sh

include $(scripts_dir_path)/terraform/import.mk
