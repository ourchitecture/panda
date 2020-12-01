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

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
  tags     = local.tutorial_tags
}
