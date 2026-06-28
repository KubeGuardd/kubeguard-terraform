variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the Virtual Network"
  type        = map(string)

  default = {
    Project     = "KubeGuard"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}