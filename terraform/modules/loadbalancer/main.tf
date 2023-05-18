resource "azurerm_lb" "loadbalancer" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                  = "frontend_ip"
    public_ip_address_id  = var.public_ip_address
  }
    sku                   = "Standard"
}

resource "azurerm_lb_backend_address_pool" "address_pool" {
  name            = "Backend-Pool"
  loadbalancer_id = azurerm_lb.loadbalancer.id
}

resource "azurerm_lb_backend_address_pool_address" "webserver1_address" {
  name                    = "webserver1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.address_pool.id
  virtual_network_id      = var.virtual_network_id
  ip_address              = var.webservers_ip_addresses[0]
}

resource "azurerm_lb_backend_address_pool_address" "webserver2_address" {
  name                    = "webserver2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.address_pool.id
  virtual_network_id      = var.virtual_network_id
  ip_address              = var.webservers_ip_addresses[1]
}

resource "azurerm_lb_backend_address_pool_address" "webserver3_address" {
  name                    = "webserver3"
  backend_address_pool_id = azurerm_lb_backend_address_pool.address_pool.id
  virtual_network_id      = var.virtual_network_id
  ip_address              = var.webservers_ip_addresses[2]
}

resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "probe"
  port            = 80
}

resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.loadbalancer.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontend_ip"
}