output "aks_id" {  
  description = "AKS cluster resource ID."
  value       = azurerm_kubernetes_cluster.this.id
}

output "aks_fqdn" {
  description = "AKS private FQDN."
  value       = azurerm_kubernetes_cluster.this.private_fqdn
}

output "kubelet_identity_object_id" {
  description = "AKS kubelet identity object ID."
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

output "aks_identity_principal_id" {
  description = "AKS control-plane identity principal ID."
  value       = azurerm_user_assigned_identity.this.principal_id
}
