output "vm_id" {
  description = "Virtual machine resource ID."
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_private_ip" {
  description = "Virtual machine private IP address."
  value       = azurerm_network_interface.this.private_ip_address
}
