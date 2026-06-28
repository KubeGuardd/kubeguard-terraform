resource_group_name = "Surya-RG"
location            = "Central India"

tags = {
  Project     = "KubeGuard"
  Environment = "Production"
  ManagedBy   = "Terraform"
}

vnets = {
  vnet1 = {
    name          = "Vnet-1"
    address_space = ["10.0.0.0/16"]
  }

  vnet2 = {
    name          = "Vnet-2"
    address_space = ["172.16.0.0/16"]
  }

  vnet3 = {
    name          = "Vnet-3"
    address_space = ["192.168.0.0/16"]
  }
}

subnets = {
  agw_subnet = {
    name             = "AGW-Subnet"
    vnet_key         = "vnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  bastion_subnet = {
    name             = "AzureBastionSubnet"
    vnet_key         = "vnet1"
    address_prefixes = ["10.0.2.0/24"]
  }

  aks_subnet = {
    name             = "AKS-Subnet"
    vnet_key         = "vnet2"
    address_prefixes = ["172.16.1.0/24"]
  }

  vm_subnet = {
    name             = "VM-Subnet"
    vnet_key         = "vnet2"
    address_prefixes = ["172.16.2.0/24"]
  }

  private_endpoint_subnet = {
    name             = "PrivateEndpointSubnet"
    vnet_key         = "vnet3"
    address_prefixes = ["192.168.1.0/24"]
  }
}