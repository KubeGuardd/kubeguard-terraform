data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                          = var.key_vault_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  sku_name                      = "standard"
  public_network_access_enabled = false
  purge_protection_enabled      = var.purge_protection_enabled
  soft_delete_retention_days    = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.aks_identity_principal_id

    secret_permissions = [
      "Get",
      "List"
    ]
  }
}

resource "azurerm_private_endpoint" "this" {
  name                = var.keyvault_pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.pe_subnet_id

  private_service_connection {
    name                           = "${var.keyvault_pe_name}-connection"
    private_connection_resource_id = azurerm_key_vault.this.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "${var.keyvault_pe_name}-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  depends_on = [azurerm_key_vault.this]
}
