data "azurerm_virtual_network" "vm_vnet" {
  name                = var.lab01_vm_vnet_name
  resource_group_name = var.rg_name
}
