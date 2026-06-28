output "agw_id" {
  description = "Application Gateway resource ID."
  value       = azurerm_application_gateway.this.id
}

output "agw_public_ip_address" {
  description = "Application Gateway public IP address."
  value       = azurerm_public_ip.this.ip_address
}
