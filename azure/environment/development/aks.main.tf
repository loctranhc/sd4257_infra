module "aks_vnet" {
  source = "../../modules/vnet"

  rg_name       = module.resource_group.name
  rg_location   = module.resource_group.location
  vnet_name     = var.aks_vnet_name
  address_space = var.aks_address_space
}

module "aks_subnet" {
  source = "../../modules/subnet"

  subnet_name     = var.aks_subnet_name
  vnet_name       = module.aks_vnet.name
  rg_name         = module.resource_group.name
  address_prefixs = var.aks_address_prefixs
}