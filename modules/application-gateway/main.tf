locals {
  gateway_ip_configuration_name  = "${var.agw_name}-gateway-ip"
  frontend_ip_configuration_name = "${var.agw_name}-frontend-ip"
  frontend_port_name             = "${var.agw_name}-frontend-port"
  backend_address_pool_name      = "default-backend-pool"
  backend_http_settings_name     = "default-http-settings"
  http_listener_name             = "default-http-listener"
  request_routing_rule_name      = "default-routing-rule"
}

resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_web_application_firewall_policy" "this" {
  name                = var.waf_policy_name
  location            = var.location
  resource_group_name = var.resource_group_name

  policy_settings {
    enabled = true
    mode    = "Detection"
  }

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }
}

resource "azurerm_application_gateway" "this" {
  name                = var.agw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  firewall_policy_id  = azurerm_web_application_firewall_policy.this.id

  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 1
  }

  gateway_ip_configuration {
    name      = local.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.this.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  # Placeholder configuration; AGIC manages application-specific pools and listeners.
  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.http_listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.http_listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.backend_http_settings_name
    priority                   = 100
  }

  ssl_policy {
  policy_type = "Predefined"
  policy_name = "AppGwSslPolicy20220101"
  }

  depends_on = [
    azurerm_public_ip.this,
    azurerm_web_application_firewall_policy.this
  ]
}
