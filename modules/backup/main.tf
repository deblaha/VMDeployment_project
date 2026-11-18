data "azurerm_recovery_services_vault" "my-rsv" {
  name = var.vault_name
  resource_group_name = var.rg_name
}

data "azurerm_backup_policy_vm" "my-bkp" {
  name = var.policy_name
  recovery_vault_name = data.azurerm_recovery_services_vault.my-rsv.name
  resource_group_name = var.rg_name
}

resource "azurerm_backup_protected_vm" "my-backup" {
  resource_group_name = var.rg_name
  source_vm_id = var.vm_id
  recovery_vault_name = data.azurerm_recovery_services_vault.my-rsv.name
  backup_policy_id = data.azurerm_backup_policy_vm.my-bkp.id
}