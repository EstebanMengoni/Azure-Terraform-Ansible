resource "azurerm_lb" "loadbalancer" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                  = "PublicIPAddress"
    public_ip_address_id  = var.public_ip_address
  }
}

resource "azurerm_lb_backend_address_pool" "address_pool" {
  name            = "Backend-Pool"
  loadbalancer_id = azurerm_lb.loadbalancer.id
}

resource "azurerm_network_interface_backend_address_pool_association" "network_address_pool" {
  network_interface_id    = var.network_interface_id
  ip_configuration_name   = var.ip_configuration_name
  backend_address_pool_id = azurerm_lb_backend_address_pool.address_pool.id
}