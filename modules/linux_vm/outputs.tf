output "vm_id" {
  description = "ID of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  description = "Name of the Linux virtual machine."
  value       = azurerm_linux_virtual_machine.this.name
}

output "vm_private_ip" {
  description = "Private IP address assigned to the virtual machine NIC."
  value       = azurerm_network_interface.this.private_ip_address
}

output "nic_id" {
  description = "ID of the virtual machine network interface."
  value       = azurerm_network_interface.this.id
}

output "nic_name" {
  description = "Name of the virtual machine network interface."
  value       = azurerm_network_interface.this.name
}
