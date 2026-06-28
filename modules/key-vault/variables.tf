variable "key_vault_name" {
  type        = string
  description = "Key Vault name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "keyvault_pe_name" {
  type        = string
  description = "Key Vault private endpoint name."
}

variable "pe_subnet_id" {
  type        = string
  description = "Private endpoint subnet resource ID."
}

variable "private_dns_zone_id" {
  type        = string
  description = "Key Vault private DNS zone resource ID."
}

variable "aks_identity_principal_id" {
  type        = string
  description = "AKS user-assigned identity principal ID."
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Whether Key Vault purge protection is enabled."
}
