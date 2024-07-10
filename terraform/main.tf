terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = "customRG"
}

module "virtual_network" {
  source = "./modules/virtual_network"
  vnet_name = "customVNet"
  web_subnet_name = "webapp_subnet"
  db_subnet_name = "mysql_subnet"
  rg_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location

}

module "mysql_server" {
  source = "./modules/storage"
  sql_login = "achref"
  sql_login_pass = "Habli123@"
  db_name = "mysql-server11"
  database = "webapp"
  rg_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  
}

module "app_service" {
  source = "./modules/app_service"
  rg_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  dotnet_version = "v5.0"
  gateway_ip = module.app_gateway.gateway_ip
  gateway_subnet_id = module.virtual_network.gateway_subnet_id
}

module "app_gateway" {
  source = "./modules/app_gateway"
  rg_name = data.azurerm_resource_group.rg.name
  location = data.azurerm_resource_group.rg.location
  gateway_subnet_id = module.virtual_network.gateway_subnet_id
  backend_fqdns = module.app_service.backend_fqdns
}
