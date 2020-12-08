include ../../../../../../.vars.mk

include $(src_dir_path)/tutorials/terraform/azure/common.mk

include $(scripts_dir_path)/terraform/azure/import.mk

.PHONY: import-resource-group
import-resource-group:
ifndef ARM_SUBSCRIPTION_ID
	$(error ARM_SUBSCRIPTION_ID is not set)
endif
ifndef ARM_TERRAFORM_BACKEND_RESOURCE_GROUP
	$(error ARM_TERRAFORM_BACKEND_RESOURCE_GROUP is not set)
endif
	@make terraform-import \
		RESOURCE_ADDRESS="module.backend.azurerm_resource_group.instance" \
		RESOURCE_ID="/subscriptions/$(ARM_SUBSCRIPTION_ID)/resourceGroups/$(ARM_TERRAFORM_BACKEND_RESOURCE_GROUP)"

.PHONY: import-storage-account
import-storage-account:
ifndef ARM_SUBSCRIPTION_ID
	$(error ARM_SUBSCRIPTION_ID is not set)
endif
ifndef ARM_TERRAFORM_BACKEND_RESOURCE_GROUP
	$(error ARM_TERRAFORM_BACKEND_RESOURCE_GROUP is not set)
endif
ifndef ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT
	$(error ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT is not set)
endif
	@make terraform-import \
		RESOURCE_ADDRESS="module.backend.azurerm_storage_account.instance" \
		RESOURCE_ID="/subscriptions/$(ARM_SUBSCRIPTION_ID)/resourceGroups/$(ARM_TERRAFORM_BACKEND_RESOURCE_GROUP)/providers/Microsoft.Storage/storageAccounts/$(ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT)/"

.PHONY: import-storage-container
import-storage-container:
ifndef ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT
	$(error ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT is not set)
endif
	@make terraform-import \
		RESOURCE_ADDRESS="module.backend.azurerm_storage_container.instance" \
		RESOURCE_ID="https://$(ARM_TERRAFORM_BACKEND_STORAGE_ACCOUNT).blob.core.windows.net/tutorials"

.PHONY: import
import: import-resource-group import-storage-account import-storage-container
