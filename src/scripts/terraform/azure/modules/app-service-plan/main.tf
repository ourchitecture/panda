data "azurerm_resource_group" "instance_rg" {
  name = var.resource_group_name
}

resource "azurerm_app_service_plan" "instance" {
  resource_group_name = data.azurerm_resource_group.instance_rg.name
  location            = data.azurerm_resource_group.instance_rg.location

  name     = var.plan_name
  kind     = var.plan_kind
  reserved = var.plan_is_reserved
  tags     = var.tags

  sku {
    tier = var.plan_sku_tier
    size = var.plan_sku_size
  }
}

output "azurerm_app_service_plan-output" {
  value = azurerm_app_service_plan.instance
}
