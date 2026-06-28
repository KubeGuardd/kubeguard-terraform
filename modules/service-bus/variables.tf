variable "service_bus_name" {
  type        = string
  description = "Service Bus namespace name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "service_bus_sku" {
  type        = string
  description = "Service Bus namespace SKU."
}
