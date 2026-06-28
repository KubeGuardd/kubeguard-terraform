output "service_bus_id" {
  description = "Service Bus namespace resource ID."
  value       = azurerm_servicebus_namespace.this.id
}

output "service_bus_endpoint" {
  description = "Service Bus namespace endpoint."
  value       = azurerm_servicebus_namespace.this.endpoint
}
