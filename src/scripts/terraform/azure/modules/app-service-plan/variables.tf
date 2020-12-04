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

variable "plan_name" {
  type        = string
  description = "Name of the AppService Plan"
}

variable "plan_kind" {
  type        = string
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan)."
}

variable "plan_is_reserved" {
  type        = bool
  description = "The plan is reserved or not"
}

variable "plan_sku_tier" {
  type        = string
  description = "Specifies the plan's pricing tier."
  default     = "Free"
}

variable "plan_sku_size" {
  type        = string
  description = "Specifies the plan's instance size."
  default     = "F1"
}
