provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "resource-group" {
  source = "/our/terraform/azure/modules/resource-group"

  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}

output "resource-group" {
  value = module.resource-group
}
