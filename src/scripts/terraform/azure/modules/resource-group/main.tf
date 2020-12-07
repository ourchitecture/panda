resource "azurerm_resource_group" "instance" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

output "azurerm_resource_group-output" {
  value = azurerm_resource_group.instance
}
