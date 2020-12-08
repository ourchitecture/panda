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

variable "storage_name_prefix" {
  type        = string
  description = "Prefix to be used in naming the Storage Account"
}

variable "storage_tier" {
  type        = string
  description = "SKU tier for the Storage Account"
  default     = "Standard"
}

variable "storage_replication" {
  type        = string
  description = "Replication strategy for the Storage Account"
  default     = "LRS"
}

variable "storage_id_tag_value" {
  type        = string
  description = "Unique identifier to tag the Storge Account with. Because storage accounts are named with randomized numbers, this enables automation to easily lookup the storage account using the unique id tag."
}

variable "storage_container_name" {
  type        = string
  description = "The name of the storage account container (like a directory)"
}
