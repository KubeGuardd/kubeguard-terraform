variable "dns_zone_name" {
  type        = string
  description = "Private DNS zone name."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "vnet_link_name" {
  type        = string
  description = "Private DNS virtual network link name."
}

variable "vnet_id" {
  type        = string
  description = "Virtual network resource ID."
}
