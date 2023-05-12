resource "azurerm_resource_group" "rg" {
    name = var.rg_name
    location = "useast"
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.rg.name
  address_space      = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]

  subnet_service_endpoints = {
    "subnet1" : ["Microsoft.Sql"]
  }
  tags = {
    environment = var.environment
  }

  depends_on = [azurerm_resource_group.example]
}