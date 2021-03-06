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

variable "resource_group_location" {
  type        = string
  description = "Location for the Resource Group"
}

variable "storage_name_prefix" {
  type        = string
  description = "Prefix to be used in creating a random name for the Storage Account. If storage_name is provided, this will be ignored."
  default     = ""
}

variable "storage_name" {
  type        = string
  description = "Name of the Storage Account. For a randomly unique storage account name, instead provide a value for storage_name_prefix."
  default     = ""
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
