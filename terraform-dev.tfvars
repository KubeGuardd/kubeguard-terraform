location            = "centralindia"
resource_group_name = "kubeguard-rg"

vnet1_name            = "Vnet1"
vnet1_address_space   = ["10.0.0.0/16"]
agw_subnet_name       = "AGW-Subnet"
agw_subnet_prefix     = "10.0.1.0/24"
bastion_subnet_name   = "AzureBastionSubnet"
bastion_subnet_prefix = "10.0.2.0/24"

vnet2_name          = "Vnet2"
vnet2_address_space = ["172.16.0.0/16"]
aks_subnet_name     = "AKS-Subnet"
aks_subnet_prefix   = "172.16.1.0/24"

vnet3_name          = "Vnet3"
vnet3_address_space = ["192.168.0.0/16"]
pe_subnet_name      = "PrivateEndpointSubnet"
pe_subnet_prefix    = "192.168.1.0/24"

agw_name           = "kubeguard-agw"
agw_public_ip_name = "kubeguard-agw-ip"
waf_policy_name    = "kubeguard-agw-waf"

bastion_name           = "kubeguard-bastion"
bastion_public_ip_name = "kubeguard-bastion-ip"

acr_name = "kubeguardcr"
acr_sku  = "Standard"

aks_cluster_name       = "kubeguard-cluster"
aks_node_pool_name     = "systempool"
aks_node_count_min     = 2
aks_node_count_max     = 3
aks_vm_size            = "Standard_D2s_v3"
aks_availability_zones = ["1"]
aks_service_cidr       = "172.20.0.0/16"
aks_dns_service_ip     = "172.20.0.10"
aks_identity_name      = "kubeguard-aks-identity"

vm_name              = "kubeguard-vm"
vm_size              = "Standard_B2s"
vm_admin_username    = "surya"
vm_admin_password    = "Password@123"
vm_os_disk_name      = "kubeguard-vm-osdisk"
vm_nic_name          = "kubeguard-vm-nic"
vm_nsg_name          = "kubeguard-vm-nsg"
vm_availability_zone = "1"

cosmosdb_account_name   = "kubeguard-mongodbapps"
cosmosdb_mongo_version  = "4.2"
cosmosdb_admin_username = "mongodb"
cosmosdb_admin_password = "Admin123"
mongodb_pe_name         = "mongodb-pe"
mongodb_dns_zone_name   = "privatelink.mongo.cosmos.azure.com"

storage_account_name  = "kubeguardstg"
storage_pe_name       = "storage-pe"
storage_dns_zone_name = "privatelink.blob.core.windows.net"

service_bus_name = "kubeguard-service-bus"
service_bus_sku  = "Basic"

key_vault_name                     = "kubeguard-keyvault"
keyvault_pe_name                   = "keyvault-pe"
keyvault_dns_zone_name             = "privatelink.vaultcore.azure.net"
key_vault_purge_protection_enabled = false

peering_vnet1_to_vnet2_name = "vnet1-to-vnet2"
peering_vnet2_to_vnet1_name = "vnet2-to-vnet1"
peering_vnet2_to_vnet3_name = "vnet2-to-vnet3"
peering_vnet3_to_vnet2_name = "vnet3-to-vnet2"
