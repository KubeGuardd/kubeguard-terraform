resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "this" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }

  name                                      = each.value.name
  resource_group_name                       = var.resource_group_name
  virtual_network_name                      = azurerm_virtual_network.this.name
  address_prefixes                          = [each.value.prefix]
  private_endpoint_network_policies_enabled = each.value.enable_private_endpoint_network_policies

  depends_on = [azurerm_virtual_network.this]
}
