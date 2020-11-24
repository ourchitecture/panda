variable "tags" {
  type        = map(string)
  description = "Resource tags"

  default = {
    created-by = "ourchitecture-tutorials"
    managed-by = "terraform"
  }
}

variable "rg_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "rg_location" {
  type        = string
  description = "Location for the Resource Group"
}
