output "db_subnet_id" {
  value = azurerm_subnet.mysql_subnet.id
}
output "gateway_subnet_id" {
  value = azurerm_subnet.app_gateway.id
}