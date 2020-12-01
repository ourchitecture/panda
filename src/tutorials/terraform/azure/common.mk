ARM_RESOURCE_GROUP?="our-tutorials-rg"

# tutorials base
include $(src_dir_path)/tutorials/terraform/common.mk

# azure cli
include $(scripts_dir_path)/azure/common.mk

# azurerm provider for terraform
include $(scripts_dir_path)/terraform/azure/common.mk
