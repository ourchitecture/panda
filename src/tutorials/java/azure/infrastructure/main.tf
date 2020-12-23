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

module "mod_app_services_java" {
  source = "/our/terraform/azure/modules/app-services/java"

  resource_group_name   = var.resource_group_name
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
}

output "java" {
  value     = module.mod_app_services_java
  sensitive = true
}
