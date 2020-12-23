data "azurerm_resource_group" "instance_rg" {
  name = var.resource_group_name
}

data "azurerm_app_service_plan" "instance_plan" {
  resource_group_name = var.resource_group_name
  name                = var.app_service_plan_name
}

resource "azurerm_app_service" "instance" {
  resource_group_name = data.azurerm_resource_group.instance_rg.name
  location            = data.azurerm_resource_group.instance_rg.location
  app_service_plan_id = data.azurerm_app_service_plan.instance_plan.id

  name                    = var.app_service_name
  client_affinity_enabled = var.client_affinity_enabled
  https_only              = var.https_only

  site_config {
    http2_enabled             = var.http2_enabled
    linux_fx_version          = var.linux_fx_version
    use_32_bit_worker_process = var.use_32_bit_worker_process
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"           = var.website_run_from_package == true ? "1" : "0"
    "SCM_DO_BUILD_DURING_DEPLOYMENT"     = var.scm_do_build_during_deployment == true ? "1" : "0"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS" = var.website_httplogging_retention_days
  }
}

output "azurerm_app_service-output" {
  value     = azurerm_app_service.instance
  sensitive = true
}
