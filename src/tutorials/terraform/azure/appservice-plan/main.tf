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

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

resource "azurerm_app_service_plan" "plan" {
  name                = var.plan_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  kind                = var.plan_kind
  reserved            = var.plan_is_reserved
  tags                = local.tutorial_tags

  sku {
    tier = var.plan_sku_tier
    size = var.plan_sku_size
  }
}
