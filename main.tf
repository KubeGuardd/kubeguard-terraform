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