output "storage_account_id" {
  description = "Storage account resource ID."
  value       = azurerm_storage_account.this.id
}

output "storage_primary_blob_endpoint" {
  description = "Storage account primary Blob endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}
