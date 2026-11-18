data "azurerm_resource_group" "my-rg" {
  name = "vm-rg"
}

module "network" {
  source = "./modules/network"
  rg_name = data.azurerm_resource_group.my-rg.name
  loc_name = var.location_name
  vnet_name = local.virtual_network_name
  subnet_name = local.snet_name
  subnet_prefixes = var.snet_prefixes
  vnet_address_spaces = var.virtutal_network_add_spaces
  pubip_name = local.publicip_name
  nic_card_name = local.network_interface_name
  nsg_name = local.network_security_group_name
}

module "vm" {
  source = "./modules/vm"
  vm_name = local.virtual_machine_name
  rg_name = data.azurerm_resource_group.my-rg.name
  loc_name = var.location_name
  vm_size = var.virtual_machine_sku
  nic_id = module.network.nic_id
  user_name = var.loginname
  user_pwd = var.loginpwd
}

module "backup" {
  source = "./modules/backup"
  vault_name = var.rsv_name
  policy_name = var.bkp_name
  rg_name = data.azurerm_resource_group.my-rg.name
  vm_id = module.vm.vm_id
}