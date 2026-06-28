output "bastion_id" {
  description = "Bastion host resource ID."
  value       = azurerm_bastion_host.this.id
}
