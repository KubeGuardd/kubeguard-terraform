variable "bastion_name" {
  type        = string
  description = "Bastion host name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "public_ip_name" {
  type        = string
  description = "Bastion public IP name."
}

variable "subnet_id" {
  type        = string
  description = "AzureBastionSubnet resource ID."
}
