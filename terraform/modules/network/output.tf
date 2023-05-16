output "network_interface_ids" {
    value = azurerm_network_interface.nic.id
}

output "vnet_location" {
    value = azurerm_resource_group.rg.location
}

output "vnet_id" {
    value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
    value = azurerm_subnet.subnet.id
}