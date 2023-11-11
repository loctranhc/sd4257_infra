resource "azurerm_private_endpoint" "pep" {
  name                = var.pep_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.service_connection_name
    private_connection_resource_id = var.resource_id
    is_manual_connection           = false
    subresource_names              = var.subresource_names
  }

  private_dns_zone_group {
    name                 = var.private_dns_zone_group_name
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}
