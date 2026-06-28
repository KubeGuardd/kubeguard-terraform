variable "peering_name" {
  description = "Name of the virtual network peering."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the source virtual network."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the source virtual network."
  type        = string
}

variable "remote_virtual_network_id" {
  description = "ID of the remote virtual network."
  type        = string
}

variable "allow_virtual_network_access" {
  description = "Controls access between the peered virtual networks."
  type        = bool
}

variable "allow_forwarded_traffic" {
  description = "Controls forwarded traffic from the remote virtual network."
  type        = bool
}

variable "allow_gateway_transit" {
  description = "Controls gateway transit from the source virtual network."
  type        = bool
}

variable "use_remote_gateways" {
  description = "Controls use of remote virtual network gateways."
  type        = bool
}
