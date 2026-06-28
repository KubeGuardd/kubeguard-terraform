variable "peering_name" {
  type        = string
  description = "Virtual network peering name."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "src_vnet_name" {
  type        = string
  description = "Source virtual network name."
}

variable "dst_vnet_id" {
  type        = string
  description = "Destination virtual network resource ID."
}
