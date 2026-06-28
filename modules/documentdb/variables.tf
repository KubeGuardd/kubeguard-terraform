variable "cluster_name" {
  description = "Name of the Azure DocumentDB MongoDB-compatible cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the existing resource group."
  type        = string
}

variable "location" {
  description = "Azure region for the DocumentDB resources."
  type        = string
}

variable "administrator_username" {
  description = "Administrator username for the MongoDB-compatible cluster."
  type        = string
}

variable "administrator_password" {
  description = "Administrator password for the MongoDB-compatible cluster."
  type        = string
  sensitive   = true
}

variable "shard_count" {
  description = "Number of shards provisioned for the cluster."
  type        = number
}

variable "compute_tier" {
  description = "Compute tier assigned to the cluster."
  type        = string
}

variable "high_availability_mode" {
  description = "High availability mode assigned to the cluster."
  type        = string
}

variable "storage_size_in_gb" {
  description = "Storage capacity of the cluster in gigabytes."
  type        = number
}

variable "mongo_version" {
  description = "MongoDB compatibility version of the cluster."
  type        = string
}

variable "private_endpoint_name" {
  description = "Name of the private endpoint."
  type        = string
}

variable "private_endpoint_subnet_id" {
  description = "ID of the existing subnet used by the private endpoint."
  type        = string
}

variable "private_dns_vnet_id" {
  description = "ID of the existing virtual network linked to private DNS."
  type        = string
}

variable "private_dns_zone_name" {
  description = "Name of the private DNS zone."
  type        = string
}

variable "tags" {
  description = "Tags applied to the DocumentDB resources."
  type        = map(string)
}
