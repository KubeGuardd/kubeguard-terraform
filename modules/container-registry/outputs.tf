output "acr_id" {
  description = "Container Registry resource ID."
  value       = azurerm_container_registry.this.id
}

output "acr_login_server" {
  description = "Container Registry login server."
  value       = azurerm_container_registry.this.login_server
}
