resource "tls_private_key" "webservers_ssh" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "local_file" "linuxkey" {
    filename  = "webservers.pem"
    content   = tls_private_key.webservers_ssh.private_key_pem
}

resource "azurerm_linux_virtual_machine" "webservers" {
  name                  = var.vm_name
  resource_group_name   = var.rg_name
  location              = var.location
  size                  = "Standard_D4s_v3"
  admin_username        = "adminuser"
  network_interface_ids = var.network_interface_ids

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.webservers_ssh.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  depends_on = [ tls_private_key.webservers_ssh ]
}