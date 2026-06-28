resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "this" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  ip_configuration {
    name                 = "${var.bastion_name}-ip-config"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.this.id
  }

  depends_on = [azurerm_public_ip.this]
}
