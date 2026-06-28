variable "bastion_name" {
  description = "Name of the Azure Bastion host."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the Bastion public IP."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Bastion resources."
  type        = string
}

variable "location" {
  description = "Azure region for the Bastion resources."
  type        = string
}

variable "subnet_id" {
  description = "ID of the existing AzureBastionSubnet."
  type        = string
}

variable "sku" {
  description = "SKU of the Azure Bastion host."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Bastion resources."
  type        = map(string)
}
