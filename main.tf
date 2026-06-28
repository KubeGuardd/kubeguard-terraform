module "resource_group" {
  source   = "./modules/resource-group"
  name     = var.resource_group_name
  location = var.location
}

module "vnet1" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet1_name
  address_space       = var.vnet1_address_space
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnets = [
    {
      name                                     = var.agw_subnet_name
      prefix                                   = var.agw_subnet_prefix
      enable_private_endpoint_network_policies = true
    },
    {
      name                                     = var.bastion_subnet_name
      prefix                                   = var.bastion_subnet_prefix
      enable_private_endpoint_network_policies = true
    }
  ]

  depends_on = [module.resource_group]
}

module "vnet2" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet2_name
  address_space       = var.vnet2_address_space
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnets = [
    {
      name                                     = var.aks_subnet_name
      prefix                                   = var.aks_subnet_prefix
      enable_private_endpoint_network_policies = true
    }
  ]

  depends_on = [module.resource_group]
}

module "vnet3" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet3_name
  address_space       = var.vnet3_address_space
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnets = [
    {
      name                                     = var.pe_subnet_name
      prefix                                   = var.pe_subnet_prefix
      enable_private_endpoint_network_policies = false
    }
  ]

  depends_on = [module.resource_group]
}

module "private_dns_mongodb" {
  source              = "./modules/private-dns"
  dns_zone_name       = var.mongodb_dns_zone_name
  resource_group_name = module.resource_group.name
  vnet_link_name      = "${var.vnet2_name}-mongodb-link"
  vnet_id             = module.vnet2.vnet_id

  depends_on = [module.vnet2]
}

module "private_dns_storage" {
  source              = "./modules/private-dns"
  dns_zone_name       = var.storage_dns_zone_name
  resource_group_name = module.resource_group.name
  vnet_link_name      = "${var.vnet2_name}-storage-link"
  vnet_id             = module.vnet2.vnet_id

  depends_on = [module.vnet2]
}

module "private_dns_keyvault" {
  source              = "./modules/private-dns"
  dns_zone_name       = var.keyvault_dns_zone_name
  resource_group_name = module.resource_group.name
  vnet_link_name      = "${var.vnet2_name}-keyvault-link"
  vnet_id             = module.vnet2.vnet_id

  depends_on = [module.vnet2]
}

module "application_gateway" {
  source              = "./modules/application-gateway"
  agw_name            = var.agw_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  public_ip_name      = var.agw_public_ip_name
  waf_policy_name     = var.waf_policy_name
  subnet_id           = module.vnet1.subnet_ids[var.agw_subnet_name]

  depends_on = [module.vnet1]
}

module "bastion" {
  source              = "./modules/bastion"
  bastion_name        = var.bastion_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  public_ip_name      = var.bastion_public_ip_name
  subnet_id           = module.vnet1.subnet_ids[var.bastion_subnet_name]

  depends_on = [module.vnet1]
}

module "acr" {
  source              = "./modules/container-registry"
  acr_name            = var.acr_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  sku                 = var.acr_sku

  depends_on = [module.resource_group]
}

module "aks" {
  source                 = "./modules/aks"
  aks_cluster_name       = var.aks_cluster_name
  location               = module.resource_group.location
  resource_group_name    = module.resource_group.name
  aks_identity_name      = var.aks_identity_name
  aks_node_pool_name     = var.aks_node_pool_name
  aks_vm_size            = var.aks_vm_size
  aks_node_count_min     = var.aks_node_count_min
  aks_node_count_max     = var.aks_node_count_max
  aks_availability_zones = var.aks_availability_zones
  aks_service_cidr       = var.aks_service_cidr
  aks_dns_service_ip     = var.aks_dns_service_ip
  aks_subnet_id          = module.vnet2.subnet_ids[var.aks_subnet_name]
  acr_id                 = module.acr.acr_id

  depends_on = [module.vnet2, module.acr]
}

module "virtual_machine" {
  source               = "./modules/virtual-machine"
  vm_name              = var.vm_name
  location             = module.resource_group.location
  resource_group_name  = module.resource_group.name
  vm_size              = var.vm_size
  vm_admin_username    = var.vm_admin_username
  vm_admin_password    = var.vm_admin_password
  vm_os_disk_name      = var.vm_os_disk_name
  vm_nic_name          = var.vm_nic_name
  vm_nsg_name          = var.vm_nsg_name
  subnet_id            = module.vnet2.subnet_ids[var.aks_subnet_name]
  vm_availability_zone = var.vm_availability_zone

  depends_on = [module.vnet2]
}

module "cosmosdb" {
  source                 = "./modules/cosmosdb"
  cosmosdb_account_name  = var.cosmosdb_account_name
  location               = module.resource_group.location
  resource_group_name    = module.resource_group.name
  cosmosdb_mongo_version = var.cosmosdb_mongo_version
  mongodb_pe_name        = var.mongodb_pe_name
  pe_subnet_id           = module.vnet3.subnet_ids[var.pe_subnet_name]
  private_dns_zone_id    = module.private_dns_mongodb.private_dns_zone_id

  depends_on = [module.vnet3, module.private_dns_mongodb]
}

module "storage_account" {
  source               = "./modules/storage-account"
  storage_account_name = var.storage_account_name
  location             = module.resource_group.location
  resource_group_name  = module.resource_group.name
  storage_pe_name      = var.storage_pe_name
  pe_subnet_id         = module.vnet3.subnet_ids[var.pe_subnet_name]
  private_dns_zone_id  = module.private_dns_storage.private_dns_zone_id

  depends_on = [module.vnet3, module.private_dns_storage]
}

module "service_bus" {
  source              = "./modules/service-bus"
  service_bus_name    = var.service_bus_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  service_bus_sku     = var.service_bus_sku

  depends_on = [module.resource_group]
}

module "key_vault" {
  source                    = "./modules/key-vault"
  key_vault_name            = var.key_vault_name
  location                  = module.resource_group.location
  resource_group_name       = module.resource_group.name
  keyvault_pe_name          = var.keyvault_pe_name
  pe_subnet_id              = module.vnet3.subnet_ids[var.pe_subnet_name]
  private_dns_zone_id       = module.private_dns_keyvault.private_dns_zone_id
  aks_identity_principal_id = module.aks.aks_identity_principal_id
  purge_protection_enabled  = var.key_vault_purge_protection_enabled

  depends_on = [module.vnet3, module.private_dns_keyvault, module.aks]
}

module "peering_vnet1_to_vnet2" {
  source              = "./modules/vnet-peering"
  peering_name        = var.peering_vnet1_to_vnet2_name
  resource_group_name = module.resource_group.name
  src_vnet_name       = module.vnet1.vnet_name
  dst_vnet_id         = module.vnet2.vnet_id

  depends_on = [module.vnet1, module.vnet2]
}

module "peering_vnet2_to_vnet1" {
  source              = "./modules/vnet-peering"
  peering_name        = var.peering_vnet2_to_vnet1_name
  resource_group_name = module.resource_group.name
  src_vnet_name       = module.vnet2.vnet_name
  dst_vnet_id         = module.vnet1.vnet_id

  depends_on = [module.vnet1, module.vnet2]
}

module "peering_vnet2_to_vnet3" {
  source              = "./modules/vnet-peering"
  peering_name        = var.peering_vnet2_to_vnet3_name
  resource_group_name = module.resource_group.name
  src_vnet_name       = module.vnet2.vnet_name
  dst_vnet_id         = module.vnet3.vnet_id

  depends_on = [module.vnet2, module.vnet3]
}

module "peering_vnet3_to_vnet2" {
  source              = "./modules/vnet-peering"
  peering_name        = var.peering_vnet3_to_vnet2_name
  resource_group_name = module.resource_group.name
  src_vnet_name       = module.vnet3.vnet_name
  dst_vnet_id         = module.vnet2.vnet_id

  depends_on = [module.vnet2, module.vnet3]
}
