module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "vnets" {
  source = "./modules/vnet"

  for_each = var.vnets

  vnet_name           = each.value.name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  address_space       = each.value.address_space
  tags                = var.tags
}

module "subnets" {
  source = "./modules/subnet"

  for_each = var.subnets

  subnet_name          = each.value.name
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.vnets[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes
}

module "application_gateway" {
  source = "./modules/application_gateway"

  name                = var.application_gateway.name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.subnets[var.application_gateway.subnet_key].id
  public_ip_name      = var.application_gateway.public_ip_name
  waf_policy_name     = var.application_gateway.waf_policy_name
  sku_name            = var.application_gateway.sku_name
  sku_tier            = var.application_gateway.sku_tier
  capacity            = var.application_gateway.capacity
  frontend_port       = var.application_gateway.frontend_port
  tags                = var.tags
}

module "vnet_peerings" {
  source = "./modules/vnet_peering"

  for_each = var.vnet_peerings

  peering_name                 = each.value.name
  resource_group_name          = module.resource_group.name
  virtual_network_name         = module.vnets[each.value.source_vnet_key].name
  remote_virtual_network_id    = module.vnets[each.value.remote_vnet_key].id
  allow_virtual_network_access = each.value.allow_virtual_network_access
  allow_forwarded_traffic      = each.value.allow_forwarded_traffic
  allow_gateway_transit        = each.value.allow_gateway_transit
  use_remote_gateways          = each.value.use_remote_gateways
}

module "bastion" {
  source = "./modules/bastion"

  bastion_name        = var.bastion.name
  public_ip_name      = var.bastion.public_ip_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.subnets[var.bastion.subnet_key].id
  sku                 = var.bastion.sku
  tags                = var.tags
}

module "virtual_machine" {
  source = "./modules/linux_vm"

  vm_name             = var.virtual_machine.vm_name
  computer_name       = var.virtual_machine.computer_name
  nic_name            = var.virtual_machine.nic_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.subnets[var.virtual_machine.subnet_key].id
  vm_size             = var.virtual_machine.vm_size
  admin_username      = var.virtual_machine.admin_username
  admin_password      = var.virtual_machine.admin_password
  publisher           = var.virtual_machine.publisher
  offer               = var.virtual_machine.offer
  sku                 = var.virtual_machine.sku
  image_version       = var.virtual_machine.version
  os_disk_type        = var.virtual_machine.os_disk_type
  tags                = var.tags
}

module "documentdb" {
  source = "./modules/documentdb"

  cluster_name               = nonsensitive(var.documentdb.cluster_name)
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  administrator_username     = nonsensitive(var.documentdb.administrator_username)
  administrator_password     = var.documentdb.administrator_password
  shard_count                = nonsensitive(var.documentdb.shard_count)
  compute_tier               = nonsensitive(var.documentdb.compute_tier)
  high_availability_mode     = nonsensitive(var.documentdb.high_availability_mode)
  storage_size_in_gb         = nonsensitive(var.documentdb.storage_size_in_gb)
  mongo_version              = nonsensitive(var.documentdb.version)
  private_endpoint_name      = nonsensitive(var.documentdb.private_endpoint_name)
  private_endpoint_subnet_id = module.subnets[nonsensitive(var.documentdb.private_endpoint_subnet_key)].id
  private_dns_vnet_id        = module.vnets[nonsensitive(var.documentdb.private_dns_vnet_key)].id
  private_dns_zone_name      = nonsensitive(var.documentdb.private_dns_zone_name)
  tags                       = var.tags
}
