resource "azurerm_user_assigned_identity" "this" {
  name                = var.aks_identity_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "network_contributor" {
  scope                = var.aks_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.this.principal_id

  depends_on = [azurerm_user_assigned_identity.this]
}

resource "azurerm_kubernetes_cluster" "this" {
  name                    = var.aks_cluster_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.aks_cluster_name
  private_cluster_enabled = true
  private_dns_zone_id     = "System"

  default_node_pool {
    name                = var.aks_node_pool_name
    vm_size             = var.aks_vm_size
    enable_auto_scaling = true
    min_count           = var.aks_node_count_min
    max_count           = var.aks_node_count_max
    zones               = var.aks_availability_zones
    vnet_subnet_id      = var.aks_subnet_id
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.this.id]
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = var.aks_service_cidr
    dns_service_ip = var.aks_dns_service_ip
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  depends_on = [
    azurerm_user_assigned_identity.this,
    azurerm_role_assignment.network_contributor
  ]
}

resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id

  depends_on = [azurerm_kubernetes_cluster.this]
}
