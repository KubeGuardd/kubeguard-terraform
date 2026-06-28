output "id" {
  description = "ID of the Application Gateway."
  value       = azurerm_application_gateway.this.id
}

output "name" {
  description = "Name of the Application Gateway."
  value       = azurerm_application_gateway.this.name
}

output "public_ip_id" {
  description = "ID of the Application Gateway frontend public IP."
  value       = azurerm_public_ip.this.id
}

output "public_ip_address" {
  description = "Address of the Application Gateway frontend public IP."
  value       = azurerm_public_ip.this.ip_address
}

output "waf_policy_id" {
  description = "ID of the Application Gateway WAF policy."
  value       = azurerm_web_application_firewall_policy.this.id
}
