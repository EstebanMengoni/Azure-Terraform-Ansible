module "network_root" {
    source = "/modules/network"

    rg_name     = var.rg_name_root
    environment = var.environment_root
}

module "webservers_root" {
    source = "/modules/webservers"

    vm_name                 = var.vm_name_root
    location                = module.network.vnet_location
    rg_name                 = var.rg_name_root
    network_interface_ids   = module.network.vnet_id
}