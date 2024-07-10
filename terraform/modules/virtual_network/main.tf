
resource "azurerm_virtual_network" "customVNet" {
  name = var.vnet_name
  resource_group_name = var.rg_name
  location = var.location
  address_space = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "webapp_subnet" {
  name = var.web_subnet_name
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.customVNet.name
  address_prefixes = ["10.1.1.0/24"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action",
      ]
    }
  }

}

resource "azurerm_subnet" "mysql_subnet" {
  name = var.db_subnet_name
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.customVNet.name
  address_prefixes = ["10.1.2.0/24"]
  service_endpoints = [ "Microsoft.Sql" ] // resources deployed in this subnet will have secure access to it through azure backbone
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/servers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action",
      ]
    }
  }

}

resource "azurerm_subnet" "app_gateway" {
  name = "gateway_subnet"
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.customVNet.name
  address_prefixes = ["10.1.3.0/24"]
  service_endpoints = [ "Microsoft.Web" ]
  

}
