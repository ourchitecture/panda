provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "random_id" "random_short" {
  keepers = {
    # randomize based on resource group name
    rg_name = var.rg_name
  }

  byte_length = 2
}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

# create a storage account
resource "azurerm_storage_account" "storage" {
  # random_id: storage account names must be unique across ALL Azure accounts (the world)
  # must be 3-24 characters in length
  name                     = "${var.storage_name_prefix}${random_id.random_short.dec}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = var.storage_tier
  account_replication_type = var.storage_replication

  tags = merge(
    var.tags,
    {
      asset-id = var.storage_id_tag_value
    }
  )
}

# create a "container" (folder)
resource "azurerm_storage_container" "storage_container" {
  name                 = var.storage_container_name
  storage_account_name = azurerm_storage_account.storage.name
}
