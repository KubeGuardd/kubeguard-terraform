resource "azurerm_storage_account" "this" {
  name                          = var.storage_account_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  account_kind                  = "BlobStorage"
  public_network_access_enabled = false
  min_tls_version               = "TLS1_2"
}

resource "azurerm_private_endpoint" "this" {
  name                = var.storage_pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.pe_subnet_id

  private_service_connection {
    name                           = "${var.storage_pe_name}-connection"
    private_connection_resource_id = azurerm_storage_account.this.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "${var.storage_pe_name}-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  depends_on = [azurerm_storage_account.this]
}
