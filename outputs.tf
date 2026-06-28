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

output "application_gateway_id" {
  value = module.application_gateway.id
}

output "application_gateway_name" {
  value = module.application_gateway.name
}

output "application_gateway_public_ip_id" {
  value = module.application_gateway.public_ip_id
}

output "application_gateway_public_ip_address" {
  value = module.application_gateway.public_ip_address
}

output "application_gateway_waf_policy_id" {
  value = module.application_gateway.waf_policy_id
}

output "vnet_peering_ids" {
  value = {
    for key, peering in module.vnet_peerings : key => peering.id
  }
}

output "vnet_peering_names" {
  value = {
    for key, peering in module.vnet_peerings : key => peering.name
  }
}

output "bastion_id" {
  value = module.bastion.id
}

output "bastion_name" {
  value = module.bastion.name
}

output "bastion_public_ip_id" {
  value = module.bastion.public_ip_id
}

output "bastion_public_ip_address" {
  value = module.bastion.public_ip_address
}

output "virtual_machine_id" {
  value = module.virtual_machine.vm_id
}

output "virtual_machine_name" {
  value = module.virtual_machine.vm_name
}

output "virtual_machine_private_ip" {
  value = module.virtual_machine.vm_private_ip
}

output "virtual_machine_nic_id" {
  value = module.virtual_machine.nic_id
}

output "documentdb_cluster_id" {
  value = module.documentdb.cluster_id
}

output "documentdb_cluster_name" {
  value = module.documentdb.cluster_name
}

output "documentdb_private_endpoint_id" {
  value = module.documentdb.private_endpoint_id
}

output "documentdb_private_endpoint_name" {
  value = module.documentdb.private_endpoint_name
}

output "documentdb_private_ip" {
  value = module.documentdb.private_ip
}

output "documentdb_private_dns_zone_id" {
  value = module.documentdb.private_dns_zone_id
}
