variable "agw_name" {
  type        = string
  description = "Application Gateway name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "public_ip_name" {
  type        = string
  description = "Application Gateway public IP name."
}

variable "waf_policy_name" {
  type        = string
  description = "WAF policy name."
}

variable "subnet_id" {
  type        = string
  description = "Application Gateway subnet resource ID."
}
