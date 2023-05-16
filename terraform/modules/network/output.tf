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

# output "load_balancer_subnet_id" {
#     value = azurerm_subnet.webservers_subnet.id
# }

output "ip_configuration_name" {
    value = azurerm_network_interface.nic.ip_configuration[0].name
}

output "database_subnet_id" {
    value = azurerm_subnet.database_subnet.id
}

output "public_ip_address_id" {
    value = azurerm_public_ip.loadbalancer_public_ip.id
}