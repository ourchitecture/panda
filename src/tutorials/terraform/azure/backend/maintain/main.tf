provider "azurerm" {
  skip_provider_registration = true
  features {}
}

terraform {
  backend "azurerm" {
    # values should be passed as command-line arguments
    # https://www.terraform.io/docs/backends/config.html#backend-configuration-file
    resource_group_name  = "[value from command-line arg]"
    storage_account_name = "[value from command-line arg]"
    container_name       = "[value from command-line arg]"
    key                  = "[value from command-line arg]"
  }
}

module "backend" {
  source = "/our/terraform/azure/modules/backend"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  storage_name            = var.storage_name
  storage_tier            = var.storage_tier
  storage_replication     = var.storage_replication
  storage_container_name  = var.storage_container_name
  storage_id_tag_value    = var.storage_id_tag_value
  tags                    = var.tags
}

output "backend" {
  value     = module.backend
  sensitive = true
}
