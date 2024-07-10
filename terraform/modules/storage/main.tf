resource "azurerm_mssql_server" "mssqlServer" {
  name                         = var.db_name
  location                     = var.location
  resource_group_name = var.rg_name
  administrator_login          = var.sql_login
  administrator_login_password = var.sql_login_pass
  public_network_access_enabled = true
  version                      = "12.0"
  tags = {
    environment = "dev"
    source      = "Terraform"
  } 
}

resource "azurerm_mssql_database" "database" {
  name           = var.database
  server_id      = azurerm_mssql_server.mssqlServer.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  read_scale     = false
  sku_name       = "Basic"
   tags = {
    environment = "dev"
    source = "Terraform"

  }
   threat_detection_policy {
    state = "Enabled"
  }
}
resource "azurerm_mssql_firewall_rule" "fw-rule" {
  name                = "allow-backend"
  server_id = azurerm_mssql_server.mssqlServer.id
  start_ip_address    = "20.50.64.24"
  end_ip_address      = "20.50.64.24"
}
resource "azurerm_mssql_server_transparent_data_encryption" "data_encryption" {
  server_id = azurerm_mssql_server.mssqlServer.id
}
