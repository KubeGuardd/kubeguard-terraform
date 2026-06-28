output "cosmosdb_id" {
  description = "Cosmos DB account resource ID."
  value       = azurerm_cosmosdb_account.this.id
}

output "cosmosdb_endpoint" {
  description = "Cosmos DB endpoint."
  value       = azurerm_cosmosdb_account.this.endpoint
}
