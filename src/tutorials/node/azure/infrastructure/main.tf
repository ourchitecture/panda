provider "azurerm" {
  skip_provider_registration = true
  features {}
}

module "mod_app_services_node" {
  source = "/our/terraform/azure/modules/app-services/node"

  resource_group_name   = var.resource_group_name
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
}

output "node" {
  value = module.mod_app_services_node
}
