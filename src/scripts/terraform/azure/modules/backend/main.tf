resource "random_id" "random_short" {
  keepers = {
    # randomize based on resource group name
    resource_group_name = var.resource_group_name
  }

  byte_length = 2
}

resource "azurerm_resource_group" "instance" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags     = var.tags
}

output "azurerm_resource_group-output" {
  value = azurerm_resource_group.instance
}

# create a storage account
resource "azurerm_storage_account" "instance" {
  # use the storage_name, if provided
  # otherwise, generate a random name using the prefix
  # random_id: storage account names must be unique across ALL Azure accounts (the world)
  # must be 3-24 characters in length
  name                     = var.storage_name == "" ? "${var.storage_name_prefix}${random_id.random_short.dec}" : var.storage_name
  resource_group_name      = azurerm_resource_group.instance.name
  location                 = azurerm_resource_group.instance.location
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
resource "azurerm_storage_container" "instance" {
  name                 = var.storage_container_name
  storage_account_name = azurerm_storage_account.instance.name
}

output "azurerm_storage_account-output" {
  value = azurerm_storage_account.instance
}

output "azurerm_storage_container-output" {
  value = azurerm_storage_container.instance
}
