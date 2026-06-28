variable "vnet_name" {
  type        = string
  description = "Virtual network name."
}

variable "address_space" {
  type        = list(string)
  description = "Virtual network address spaces."
}

variable "location" {
  type        = string
  description = "Azure region for the virtual network."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "subnets" {
  type = list(object({
    name                                     = string
    prefix                                   = string
    enable_private_endpoint_network_policies = bool
  }))
  description = "Subnets to create and whether private endpoint network policies are enabled."
}
