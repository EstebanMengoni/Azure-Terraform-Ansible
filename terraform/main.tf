module "network_root" {
    source = "./modules/network"

    rg_name     = var.rg_name_root
    vnet_name   = "${var.rg_name_root}virtualnetwork"
    environment = var.environment_root
}

module "webservers_root" {
    source = "./modules/webservers"

    vm_name                 = "${module.network_root.resource_group_name}virtualmachine"
    rg_name                 = var.rg_name_root
    location                = module.network_root.vnet_location
    network_interface_ids   = [module.network_root.network_interface_ids]
    environment = var.environment_root
}

module "database_root" {
    source = "./modules/database"

    rg_name                 = module.network_root.resource_group_name
    flexible_server_name    = "${module.network_root.resource_group_name}flexibleserver"
    vnet_id                 = module.network_root.vnet_id
    subnet_id               = module.network_root.database_subnet_id
    location                = module.network_root.vnet_location
}