module "resource_group" {
  source = "../../modules/resource-group"

  rg_name     = var.rg_name
  rg_location = var.rg_location
}

module "acr_vnet" {
  source = "../../modules/vnet"

  rg_name       = module.resource_group.name
  rg_location   = module.resource_group.location
  vnet_name     = var.acr_vnet_name
  address_space = var.acr_address_space
}

module "acr_subnet" {
  source = "../../modules/subnet"

  subnet_name     = var.acr_subnet_name
  vnet_name       = module.acr_vnet.name
  rg_name         = module.resource_group.name
  address_prefixs = var.acr_address_prefixs
}

module "acr" {
  source = "../../modules/azure-container-registry"

  rg_name     = module.resource_group.name
  rg_location = module.resource_group.location
  acr_name    = var.acr_name
  sku         = var.acr_sku
}

module "acr_private_dns_zone" {
  source = "../../modules/private-dns-zone"

  rg_name               = module.resource_group.name
  private_dns_zone_name = module.acr.private_dns_zone_name
}

module "acr_private_link" {
  source = "../../modules/private-dns-zone-virtual-network-link"

  rg_name               = module.resource_group.name
  private_dns_zone_name = module.acr_private_dns_zone.name
  private_link_name     = var.acr_private_link_name
  vnet_vm_id            = data.azurerm_virtual_network.vm_vnet.id
}

module "acr_pep" {
  source = "../../modules/private-end-point"

  rg_name                     = module.resource_group.name
  rg_location                 = module.resource_group.location
  pep_name                    = var.acr_pep_name
  subnet_id                   = module.acr_subnet.subnet_id
  resource_id                 = module.acr.id
  service_connection_name     = var.acr_service_connection_name
  subresource_names           = var.acr_subresource_names
  private_dns_zone_id         = module.acr_private_dns_zone.id
}
