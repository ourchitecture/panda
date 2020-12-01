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

variable "identity_name" {
  type        = string
  description = "Name of the identity"
}
