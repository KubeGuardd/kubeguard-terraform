variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "tags" {
  description = "Tags to associate with the Resource Group"
  type        = map(string)

  default = {
    Project     = "KubeGuard"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}