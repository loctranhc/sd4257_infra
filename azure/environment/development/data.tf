data "azurerm_virtual_network" "vm_vnet" {
  name                = var.vm_vnet_name
  resource_group_name = var.vm_rg_name
}
