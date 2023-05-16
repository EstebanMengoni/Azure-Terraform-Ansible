module "network_root" {
    source = "./modules/network"

    rg_name     = var.rg_name_root
    vnet_name   = "${var.rg_name_root}virtualnetwork"
    environment = var.environment_root
}

module "webservers_root" {
    source = "./modules/webservers"

    vm_name                 = "${var.rg_name_root}virtualmachine"
    rg_name                 = var.rg_name_root
    location                = module.network_root.vnet_location
    network_interface_ids   = [module.network_root.network_interface_ids]
    environment = var.environment_root
}

module "database_root" {
    source = "./modules/database"

    rg_name                 = var.rg_name_root
    flexible_server_name    = "${var.rg_name_root}flexibleserver"
    vnet_id                 = module.network_root.vnet_id
    subnet_id               = module.network_root.subnet_id
    location                = module.network_root.vnet_location
}