variable "location" {
  type        = string
  description = "Azure region for all resources."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "vnet1_name" {
  type        = string
  description = "Name of the application gateway and Bastion virtual network."
}

variable "vnet1_address_space" {
  type        = list(string)
  description = "Address spaces for VNet1."
}

variable "agw_subnet_name" {
  type        = string
  description = "Application Gateway subnet name."
}

variable "agw_subnet_prefix" {
  type        = string
  description = "Application Gateway subnet prefix."
}

variable "bastion_subnet_name" {
  type        = string
  description = "Bastion subnet name required by Azure."
  default     = "AzureBastionSubnet"

  validation {
    condition     = var.bastion_subnet_name == "AzureBastionSubnet"
    error_message = "The Bastion subnet must be named AzureBastionSubnet."
  }
}

variable "bastion_subnet_prefix" {
  type        = string
  description = "Bastion subnet prefix."
}

variable "vnet2_name" {
  type        = string
  description = "Name of the AKS virtual network."
}

variable "vnet2_address_space" {
  type        = list(string)
  description = "Address spaces for VNet2."
}

variable "aks_subnet_name" {
  type        = string
  description = "AKS subnet name."
}

variable "aks_subnet_prefix" {
  type        = string
  description = "AKS subnet prefix."
}

variable "vnet3_name" {
  type        = string
  description = "Name of the private endpoint virtual network."
}

variable "vnet3_address_space" {
  type        = list(string)
  description = "Address spaces for VNet3."
}

variable "pe_subnet_name" {
  type        = string
  description = "Private endpoint subnet name."
}

variable "pe_subnet_prefix" {
  type        = string
  description = "Private endpoint subnet prefix."
}

variable "agw_name" {
  type        = string
  description = "Application Gateway name."
}

variable "agw_public_ip_name" {
  type        = string
  description = "Application Gateway public IP name."
}

variable "waf_policy_name" {
  type        = string
  description = "Web Application Firewall policy name."
}

variable "bastion_name" {
  type        = string
  description = "Azure Bastion host name."
}

variable "bastion_public_ip_name" {
  type        = string
  description = "Azure Bastion public IP name."
}

variable "acr_name" {
  type        = string
  description = "Azure Container Registry name."
}

variable "acr_sku" {
  type        = string
  description = "Azure Container Registry SKU."
}

variable "aks_cluster_name" {
  type        = string
  description = "AKS cluster name."
}

variable "aks_node_pool_name" {
  type        = string
  description = "AKS default node pool name."
}

variable "aks_node_count_min" {
  type        = number
  description = "Minimum AKS node count."
}

variable "aks_node_count_max" {
  type        = number
  description = "Maximum AKS node count."
}

variable "aks_vm_size" {
  type        = string
  description = "AKS node VM size."
}

variable "aks_availability_zones" {
  type        = list(string)
  description = "Availability zones for the AKS node pool."
}

variable "aks_service_cidr" {
  type        = string
  description = "AKS service network CIDR."
}

variable "aks_dns_service_ip" {
  type        = string
  description = "AKS DNS service IP."
}

variable "aks_identity_name" {
  type        = string
  description = "AKS user-assigned identity name."
}

variable "vm_name" {
  type        = string
  description = "Linux virtual machine name."
}

variable "vm_size" {
  type        = string
  description = "Linux virtual machine size."
}

variable "vm_admin_username" {
  type        = string
  description = "Linux virtual machine administrator username."
}

variable "vm_admin_password" {
  type        = string
  description = "Linux virtual machine administrator password."
  sensitive   = true
}

variable "vm_os_disk_name" {
  type        = string
  description = "Linux virtual machine OS disk name."
}

variable "vm_nic_name" {
  type        = string
  description = "Linux virtual machine network interface name."
}

variable "vm_nsg_name" {
  type        = string
  description = "Linux virtual machine network security group name."
}

variable "vm_availability_zone" {
  type        = string
  description = "Linux virtual machine availability zone."
}

variable "cosmosdb_account_name" {
  type        = string
  description = "Cosmos DB MongoDB API account name."
}

variable "cosmosdb_mongo_version" {
  type        = string
  description = "Cosmos DB MongoDB server version."

  validation {
    condition     = var.cosmosdb_mongo_version == "4.2"
    error_message = "AzureRM 3.110 supports MongoDB server version 4.2 for this configuration."
  }
}

variable "cosmosdb_admin_username" {
  type        = string
  description = "Reserved MongoDB administrator username for application configuration."
}

variable "cosmosdb_admin_password" {
  type        = string
  description = "Reserved MongoDB administrator password for application configuration."
  sensitive   = true
}

variable "mongodb_pe_name" {
  type        = string
  description = "Cosmos DB private endpoint name."
}

variable "mongodb_dns_zone_name" {
  type        = string
  description = "Cosmos DB MongoDB private DNS zone name."
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name."
}

variable "storage_pe_name" {
  type        = string
  description = "Storage private endpoint name."
}

variable "storage_dns_zone_name" {
  type        = string
  description = "Storage Blob private DNS zone name."
}

variable "service_bus_name" {
  type        = string
  description = "Service Bus namespace name."
}

variable "service_bus_sku" {
  type        = string
  description = "Service Bus namespace SKU."
}

variable "key_vault_name" {
  type        = string
  description = "Key Vault name."
}

variable "keyvault_pe_name" {
  type        = string
  description = "Key Vault private endpoint name."
}

variable "keyvault_dns_zone_name" {
  type        = string
  description = "Key Vault private DNS zone name."
}

variable "key_vault_purge_protection_enabled" {
  type        = bool
  description = "Whether purge protection is enabled for Key Vault."
}

variable "peering_vnet1_to_vnet2_name" {
  type        = string
  description = "VNet1 to VNet2 peering name."
}

variable "peering_vnet2_to_vnet1_name" {
  type        = string
  description = "VNet2 to VNet1 peering name."
}

variable "peering_vnet2_to_vnet3_name" {
  type        = string
  description = "VNet2 to VNet3 peering name."
}

variable "peering_vnet3_to_vnet2_name" {
  type        = string
  description = "VNet3 to VNet2 peering name."
}
