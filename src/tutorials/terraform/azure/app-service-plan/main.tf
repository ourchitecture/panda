provider "azurerm" {
  skip_provider_registration = true
  features {}
}

locals {
  tutorial_tags = var.tags
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "app-service-plan" {
  source = "/our/terraform/azure/modules/app-service-plan"

  resource_group_name = var.resource_group_name
  plan_name           = var.plan_name
  plan_kind           = var.plan_kind
  plan_is_reserved    = var.plan_is_reserved
  plan_sku_tier       = var.plan_sku_tier
  plan_sku_size       = var.plan_sku_size
  tags                = var.tags
}

output "app-service-plan" {
  value = module.app-service-plan
}
