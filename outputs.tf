output "resource_group_name" {
  description = "Resource group name."
  value       = module.resource_group.name
}

output "vnet1_id" {
  description = "VNet1 resource ID."
  value       = module.vnet1.vnet_id
}

output "vnet2_id" {
  description = "VNet2 resource ID."
  value       = module.vnet2.vnet_id
}

output "vnet3_id" {
  description = "VNet3 resource ID."
  value       = module.vnet3.vnet_id
}

output "agw_id" {
  description = "Application Gateway resource ID."
  value       = module.application_gateway.agw_id
}

output "agw_public_ip" {
  description = "Application Gateway public IP address."
  value       = module.application_gateway.agw_public_ip_address
}

output "bastion_id" {
  description = "Bastion host resource ID."
  value       = module.bastion.bastion_id
}

output "acr_login_server" {
  description = "Container Registry login server."
  value       = module.acr.acr_login_server
}

output "aks_cluster_id" {
  description = "AKS cluster resource ID."
  value       = module.aks.aks_id
}

output "aks_fqdn" {
  description = "AKS private FQDN."
  value       = module.aks.aks_fqdn
}

output "vm_id" {
  description = "Virtual machine resource ID."
  value       = module.virtual_machine.vm_id
}

output "vm_private_ip" {
  description = "Virtual machine private IP address."
  value       = module.virtual_machine.vm_private_ip
}

output "cosmosdb_id" {
  description = "Cosmos DB account resource ID."
  value       = module.cosmosdb.cosmosdb_id
}

output "storage_account_id" {
  description = "Storage account resource ID."
  value       = module.storage_account.storage_account_id
}

output "service_bus_id" {
  description = "Service Bus namespace resource ID."
  value       = module.service_bus.service_bus_id
}

output "key_vault_id" {
  description = "Key Vault resource ID."
  value       = module.key_vault.key_vault_id
}

output "key_vault_uri" {
  description = "Key Vault URI."
  value       = module.key_vault.key_vault_uri
}
