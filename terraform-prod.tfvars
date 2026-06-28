location            = "centralindia"
resource_group_name = "kubeguard-rg"

vnet1_name            = "kubeguard-prod-vnet1"
vnet1_address_space   = ["10.10.0.0/16"]
agw_subnet_name       = "AGW-Subnet"
agw_subnet_prefix     = "10.10.1.0/24"
bastion_subnet_name   = "AzureBastionSubnet"
bastion_subnet_prefix = "10.10.2.0/24"

vnet2_name          = "kubeguard-prod-vnet2"
vnet2_address_space = ["172.26.0.0/16"]
aks_subnet_name     = "AKS-Subnet"
aks_subnet_prefix   = "172.26.1.0/24"

vnet3_name          = "kubeguard-prod-vnet3"
vnet3_address_space = ["192.168.0.0/16"]
pe_subnet_name      = "PrivateEndpointSubnet"
pe_subnet_prefix    = "192.168.1.0/24"

agw_name           = "kubeguard-prod-agw"
agw_public_ip_name = "kubeguard-prod-agw-ip"
waf_policy_name    = "kubeguard-prod-agw-waf"

bastion_name           = "kubeguard-prod-bastion"
bastion_public_ip_name = "kubeguard-prod-bastion-ip"

acr_name = "kubeguardprodcr"
acr_sku  = "Premium"

aks_cluster_name       = "kubeguard-prod-cluster"
aks_node_pool_name     = "systempool"
aks_node_count_min     = 3
aks_node_count_max     = 6
aks_vm_size            = "Standard_D4s_v3"
aks_availability_zones = ["1", "2", "3"]
aks_service_cidr       = "172.30.0.0/16"
aks_dns_service_ip     = "172.30.0.10"
aks_identity_name      = "kubeguard-prod-aks-id"

vm_name              = "kubeguard-prod-vm"
vm_size              = "Standard_D2s_v3"
vm_admin_username    = "surya"
vm_admin_password    = "ReplaceWithSecureProdPassword@123"
vm_os_disk_name      = "kubeguard-prod-vm-osdisk"
vm_nic_name          = "kubeguard-prod-vm-nic"
vm_nsg_name          = "kubeguard-prod-vm-nsg"
vm_availability_zone = "1"

cosmosdb_account_name   = "kubeguard-prod-mongo"
cosmosdb_mongo_version  = "4.2"
cosmosdb_admin_username = "mongodb"
cosmosdb_admin_password = "ReplaceWithSecureMongoPassword@123"
mongodb_pe_name         = "kubeguard-prod-mongodb-pe"
mongodb_dns_zone_name   = "privatelink.mongo.cosmos.azure.com"

storage_account_name  = "kubeguardprodstg"
storage_pe_name       = "kubeguard-prod-storage-pe"
storage_dns_zone_name = "privatelink.blob.core.windows.net"

service_bus_name = "kubeguard-prod-service-bus"
service_bus_sku  = "Basic"

key_vault_name                     = "kubeguard-prod-kv"
keyvault_pe_name                   = "kubeguard-prod-keyvault-pe"
keyvault_dns_zone_name             = "privatelink.vaultcore.azure.net"
key_vault_purge_protection_enabled = true

peering_vnet1_to_vnet2_name = "prod-vnet1-to-vnet2"
peering_vnet2_to_vnet1_name = "prod-vnet2-to-vnet1"
peering_vnet2_to_vnet3_name = "prod-vnet2-to-vnet3"
peering_vnet3_to_vnet2_name = "prod-vnet3-to-vnet2"
