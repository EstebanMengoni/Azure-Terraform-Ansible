module "network_root" {
    source = "./modules/network"

    rg_name     = var.rg_name_root
    vnet_name   = var.vnet_name_root
    environment = var.environment_root
}

module "webservers_root" {
    source = "./modules/webservers"

    vm_name                 = var.vm_name_root
    location                = module.network_root.vnet_location
    rg_name                 = var.rg_name_root
    network_interface_ids   = [module.network_root.network_interface_ids]
    environment = var.environment_root
}