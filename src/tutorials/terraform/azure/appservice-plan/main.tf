provider "azurerm" {
  # regularly check versions at:
  # https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
  version                    = "=2.37.0"
  skip_provider_registration = true

  features {}
}

locals {
  tutorial_tags = var.tags
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "appservice-plan" {
  source = "/our/terraform/azure/modules/appservice-plan"

  resource_group_name = var.resource_group_name
  plan_name           = var.plan_name
  plan_kind           = var.plan_kind
  plan_is_reserved    = var.plan_is_reserved
  plan_sku_tier       = var.plan_sku_tier
  plan_sku_size       = var.plan_sku_size
  tags                = var.tags
}

output "appservice-plan" {
  value = module.appservice-plan
}
