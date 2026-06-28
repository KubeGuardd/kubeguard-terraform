variable "vm_name" {
  description = "Name of the Linux virtual machine."
  type        = string
}

variable "computer_name" {
  description = "Host name assigned to the Linux virtual machine."
  type        = string
}

variable "nic_name" {
  description = "Name of the virtual machine network interface."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the virtual machine."
  type        = string
}

variable "location" {
  description = "Azure region for the virtual machine."
  type        = string
}

variable "subnet_id" {
  description = "ID of the existing subnet used by the network interface."
  type        = string
}

variable "vm_size" {
  description = "Azure SKU size of the virtual machine."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the virtual machine."
  type        = string
  sensitive   = true
}

variable "publisher" {
  description = "Publisher of the virtual machine source image."
  type        = string
}

variable "offer" {
  description = "Offer of the virtual machine source image."
  type        = string
}

variable "sku" {
  description = "SKU of the virtual machine source image."
  type        = string
}

variable "image_version" {
  description = "Version of the virtual machine source image."
  type        = string
}

variable "os_disk_type" {
  description = "Storage account type for the operating system disk."
  type        = string
}

variable "tags" {
  description = "Tags applied to the virtual machine resources."
  type        = map(string)
}
