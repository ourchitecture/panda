provider "azurerm" {
  skip_provider_registration = true
  features {}
}

# get information from client configuration (e.g. az CLI)
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

# create a user-assigned identity
resource "azurerm_user_assigned_identity" "identity" {
  name                = var.identity_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  tags                = var.tags
}

resource "azurerm_role_assignment" "role_rg_reader" {
  scope                = data.azurerm_resource_group.rg.id
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
  role_definition_name = "Reader"
}
