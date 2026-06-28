output "cluster_id" {
  description = "ID of the Azure DocumentDB cluster."
  value       = azurerm_mongo_cluster.this.id
}

output "cluster_name" {
  description = "Name of the Azure DocumentDB cluster."
  value       = azurerm_mongo_cluster.this.name
}

output "private_endpoint_id" {
  description = "ID of the DocumentDB private endpoint."
  value       = azurerm_private_endpoint.this.id
}

output "private_endpoint_name" {
  description = "Name of the DocumentDB private endpoint."
  value       = azurerm_private_endpoint.this.name
}

output "private_ip" {
  description = "Private IP address assigned to the DocumentDB private endpoint."
  value       = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
}

output "private_dns_zone_id" {
  description = "ID of the DocumentDB private DNS zone."
  value       = azurerm_private_dns_zone.this.id
}
