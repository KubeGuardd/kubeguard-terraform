output "resource_group_name" {
  value = module.resource_group.name
}

output "resource_group_location" {
  value = module.resource_group.location
}

output "vnet_ids" {
  value = {
    for key, vnet in module.vnets : key => vnet.id
  }
}

output "vnet_names" {
  value = {
    for key, vnet in module.vnets : key => vnet.name
  }
}

output "subnet_ids" {
  value = {
    for key, subnet in module.subnets : key => subnet.id
  }
}

output "subnet_names" {
  value = {
    for key, subnet in module.subnets : key => subnet.name
  }
}