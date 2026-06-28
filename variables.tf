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