variable "vm_name" {
  type        = string
  description = "Virtual machine name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "vm_size" {
  type        = string
  description = "Virtual machine size."
}

variable "vm_admin_username" {
  type        = string
  description = "Administrator username."
}

variable "vm_admin_password" {
  type        = string
  description = "Administrator password."
  sensitive   = true
}

variable "vm_os_disk_name" {
  type        = string
  description = "OS disk name."
}

variable "vm_nic_name" {
  type        = string
  description = "Network interface name."
}

variable "vm_nsg_name" {
  type        = string
  description = "Network security group name."
}

variable "subnet_id" {
  type        = string
  description = "Subnet resource ID."
}

variable "vm_availability_zone" {
  type        = string
  description = "Virtual machine availability zone."
}
