variable "tags" {
  type        = map(string)
  description = "Resource tags"

  default = {
    created-by = "ourchitecture-tutorials"
    managed-by = "terraform"
  }
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of the AppService Plan"
}

variable "app_service_name" {
  type        = string
  description = "Name of the AppService"
}

variable "client_affinity_enabled" {
  type        = bool
  description = "Does the App Service send session affinity cookies, which route client requests in the same session to the same instance? Defaults to true."
  default     = true
}

variable "https_only" {
  type        = bool
  description = "Can the App Service only be accessed via HTTPS? Defaults to true."
  default     = true
}

variable "http2_enabled" {
  type        = bool
  description = "Is HTTP2 Enabled on this App Service? Defaults to true."
  default     = true
}

variable "linux_fx_version" {
  type        = string
  description = "Linux App Framework and version for the AppService. Defaults to node|10.14."
  default     = "node|10.14"
}

variable "use_32_bit_worker_process" {
  type        = bool
  description = "Does the App Service run in 32 bit mode, rather than 64 bit mode? This must be true for Free and Shared plans. Defaults to true."
  default     = true
}

variable "scm_do_build_during_deployment" {
  type        = bool
  description = "Should Azure build the application during deployment? Defaults to true."
  default     = true
}
