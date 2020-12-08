provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "backend" {
  source = "/our/terraform/azure/modules/backend"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  storage_name_prefix     = var.storage_name_prefix
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
