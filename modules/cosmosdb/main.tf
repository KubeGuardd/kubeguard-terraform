resource "azurerm_cosmosdb_account" "this" {
  name                              = var.cosmosdb_account_name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  offer_type                        = "Standard"
  kind                              = "MongoDB"
  mongo_server_version              = var.cosmosdb_mongo_version
  public_network_access_enabled     = false
  is_virtual_network_filter_enabled = false

  # AzureRM 3.110 supports MongoDB 4.2 here; MongoDB 8.0 is not supported.
  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_private_endpoint" "this" {
  name                = var.mongodb_pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.pe_subnet_id

  private_service_connection {
    name                           = "${var.mongodb_pe_name}-connection"
    private_connection_resource_id = azurerm_cosmosdb_account.this.id
    subresource_names              = ["MongoDB"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "${var.mongodb_pe_name}-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  depends_on = [azurerm_cosmosdb_account.this]
}
