data "azurerm_service_plan" "existing" {
  name = "webapp-plan-svc"
  resource_group_name = "customRG"
}

resource "azurerm_windows_web_app" "backend" {
  name                = "webapp-backend-service"
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id = data.azurerm_service_plan.existing.id
  site_config {
    ip_restriction_default_action = "Deny"
    always_on = false
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v5.0"
    }
  }
}


resource "azurerm_windows_web_app" "frontend" {
  name                = "webapp-frontend-service"
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id = data.azurerm_service_plan.existing.id
  site_config {
    ip_restriction_default_action = "Deny"

    always_on = false
    application_stack {
      current_stack  = "node"
      node_version = "~18"
    }
    ip_restriction {
      name = "allow-only-gateway-access"
      priority = 100
      virtual_network_subnet_id = var.gateway_subnet_id
      action = "Allow"
    }
  }
}
