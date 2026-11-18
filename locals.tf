locals {
  virtual_network_name = "vnet-${var.environment}-001"
  snet_name = "snet-${var.environment}-001"
  publicip_name = "pip-${var.environment}-001"
  network_interface_name = "nic-${var.environment}-001"
  network_security_group_name = "nsg-${var.environment}-001"
  virtual_machine_name = "${var.environment}-vm-001"
}