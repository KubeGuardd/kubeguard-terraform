variable "name" {
  description = "Name of the Application Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Application Gateway."
  type        = string
}

variable "location" {
  description = "Azure region for the Application Gateway resources."
  type        = string
}

variable "subnet_id" {
  description = "ID of the dedicated Application Gateway subnet."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the frontend public IP."
  type        = string
}

variable "waf_policy_name" {
  description = "Name of the Web Application Firewall policy."
  type        = string
}

variable "sku_name" {
  description = "Name of the Application Gateway SKU."
  type        = string
}

variable "sku_tier" {
  description = "Tier of the Application Gateway SKU."
  type        = string
}

variable "capacity" {
  description = "Instance capacity of the Application Gateway."
  type        = number
}

variable "frontend_port" {
  description = "Port exposed by the HTTP frontend listener."
  type        = number
}

variable "tags" {
  description = "Tags applied to the Application Gateway resources."
  type        = map(string)
}
