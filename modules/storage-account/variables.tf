variable "storage_account_name" {
  type        = string
  description = "Storage account name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "storage_pe_name" {
  type        = string
  description = "Storage private endpoint name."
}

variable "pe_subnet_id" {
  type        = string
  description = "Private endpoint subnet resource ID."
}

variable "private_dns_zone_id" {
  type        = string
  description = "Storage private DNS zone resource ID."
}
