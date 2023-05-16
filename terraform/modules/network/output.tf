output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "network_interface_ids" {
    value = azurerm_network_interface.nic.id
}

output "vnet_location" {
    value = azurerm_resource_group.rg.location
}

output "vnet_id" {
    value = azurerm_virtual_network.vnet.id
}

output "database_subnet_id" {
    value = azurerm_subnet.database_subnet.id
}