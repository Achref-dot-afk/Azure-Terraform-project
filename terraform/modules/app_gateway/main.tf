resource "azurerm_public_ip" "gateway_ip" {
  name                = "public-ip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  sku = "Standard"
}
resource "azurerm_application_gateway" "network" {
  name                = "gateway"
  resource_group_name = var.rg_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = var.gateway_subnet_id
  }

  frontend_port {
    name = "port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend_ip"
    public_ip_address_id = azurerm_public_ip.gateway_ip.id
  }

  backend_address_pool {
    name = "backend-pool"
    fqdns = [  "${var.backend_fqdns}.azurewebsites.net" ]
  }

  backend_http_settings {
    name                  = "myCustomSetting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    pick_host_name_from_backend_address = true
    
  }

  http_listener {
    name                           = "customListener"
    frontend_ip_configuration_name = "frontend_ip"
    frontend_port_name             = "port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "customRule"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "customListener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "myCustomSetting"
  }
}