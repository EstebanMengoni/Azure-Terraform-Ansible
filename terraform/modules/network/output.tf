output "network_interface_ids" {
    value = azurerm_network_interface.nic.id
}

output "vnet_location" {
    value = azurerm_resource_group.rg.location
}