variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vnets" {
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name             = string
    vnet_key         = string
    address_prefixes = list(string)
  }))
}

variable "tags" {
  type = map(string)
}

variable "application_gateway" {
  type = object({
    name            = string
    public_ip_name  = string
    waf_policy_name = string
    sku_name        = string
    sku_tier        = string
    capacity        = number
    subnet_key      = string
    frontend_port   = number
  })
}

variable "vnet_peerings" {
  type = map(object({
    name                         = string
    source_vnet_key              = string
    remote_vnet_key              = string
    allow_virtual_network_access = bool
    allow_forwarded_traffic      = bool
    allow_gateway_transit        = bool
    use_remote_gateways          = bool
  }))
}

variable "bastion" {
  type = object({
    name           = string
    public_ip_name = string
    subnet_key     = string
    sku            = string
  })
}

variable "virtual_machine" {
  type = object({
    vm_name        = string
    computer_name  = string
    nic_name       = string
    subnet_key     = string
    vm_size        = string
    admin_username = string
    admin_password = string
    publisher      = string
    offer          = string
    sku            = string
    version        = string
    os_disk_type   = string
  })

  sensitive = false
}

variable "documentdb" {
  type = object({
    cluster_name                = string
    administrator_username      = string
    administrator_password      = string
    shard_count                 = number
    compute_tier                = string
    high_availability_mode      = string
    storage_size_in_gb          = number
    version                     = string
    private_endpoint_name       = string
    private_endpoint_subnet_key = string
    private_dns_vnet_key        = string
    private_dns_zone_name       = string
  })

  sensitive = true
}
