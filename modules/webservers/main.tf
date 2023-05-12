resource "azurerm_virtual_machine" "webservers" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = var.network_interface_ids
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "webserverdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "admin"
  #  admin_password = ""
  }
  os_profile_linux_config {
    # ssh_keys {
    #   key_data = file("~/.ssh/id_rsa.pub")
    # }
    disable_password_authentication = false
  }
  tags = {
    environment = var.environment
  }
}