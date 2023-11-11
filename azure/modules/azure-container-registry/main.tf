resource "azurerm_container_registry" "acr" {
  name                          = var.acr_name
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  sku                           = var.sku
  admin_enabled                 = true
  public_network_access_enabled = false
}