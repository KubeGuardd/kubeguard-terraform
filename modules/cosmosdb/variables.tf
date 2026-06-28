variable "cosmosdb_account_name" {
  type        = string
  description = "Cosmos DB MongoDB API account name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "cosmosdb_mongo_version" {
  type        = string
  description = "MongoDB server version."
}

variable "mongodb_pe_name" {
  type        = string
  description = "Cosmos DB private endpoint name."
}

variable "pe_subnet_id" {
  type        = string
  description = "Private endpoint subnet resource ID."
}

variable "private_dns_zone_id" {
  type        = string
  description = "MongoDB private DNS zone resource ID."
}
