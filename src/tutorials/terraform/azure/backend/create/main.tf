provider "azurerm" {
  # regularly check versions at:
  # https://github.com/terraform-providers/terraform-provider-azurerm/blob/master/CHANGELOG.md
  version                    = "=2.37.0"
  skip_provider_registration = true

  features {}
}

locals {
  tfstate_tags = var.tags
}

resource "random_id" "random_short" {
  keepers = {
    # randomize based on resource group name
    rg_name = var.rg_name
  }

  byte_length = 2
}

# get information from client configuration (e.g. az CLI)
data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "tfstate_rg" {
  name     = var.rg_name
  location = var.rg_location
  tags     = local.tfstate_tags
}

# create a storage account for terraform state files
resource "azurerm_storage_account" "tfstate_storage" {
  # random_id: storage account names must be unique across ALL Azure accounts (the world)
  # must be 3-24 characters in length
  name                     = "${var.storage_name_prefix}${random_id.random_short.dec}"
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = var.storage_tier
  account_replication_type = var.storage_replication

  tags = merge(
    local.tfstate_tags,
    {
      asset-id = var.storage_id_tag_value
    }
  )
}

# create a "container" (folder) for the terraform state files
resource "azurerm_storage_container" "tfstate_storage_container" {
  name                 = var.storage_container_name
  storage_account_name = azurerm_storage_account.tfstate_storage.name
}
