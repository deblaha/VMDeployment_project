resource "azurerm_linux_virtual_machine" "my-vm" {
  name = var.vm_name
  computer_name = var.vm_name
  resource_group_name = var.rg_name
  location = var.loc_name
  network_interface_ids = [ var.nic_id ]
  size = var.vm_size
  admin_username = var.user_name
  admin_password = var.user_pwd
  disable_password_authentication = false
  os_disk {
    name = "${var.vm_name}-osdisk"
    caching = "ReadWrite"
    disk_size_gb = 64
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
   publisher = "Canonical"
   offer = "ubuntu-24_04-lts"
   sku = "server"
   version = "latest"
  }
}