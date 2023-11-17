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

module "aks_cluster" {
  source = "../../modules/azure-kubernetes-service"

  rg_name          = module.resource_group.name
  rg_location      = module.resource_group.location
  aks_cluster_name = var.aks_cluster_name
  dns_prefix       = var.aks_dns_prefix
  vnet_subnet_id   = module.aks_subnet.id
}

module "vm_peering_aks" {
  source = "../../modules/vnet-peering"

  rg_name = data.azurerm_virtual_network.vm_vnet.resource_group_name
  remote_vnet_id = module.aks_vnet.id
  source_vnet_name = data.azurerm_virtual_network.vm_vnet.name
  vnet_peering_name = var.vm_peering_aks_name
}

module "aks_peering_vm" {
  source = "../../modules/vnet-peering"

  rg_name = module.resource_group.name
  remote_vnet_id = data.azurerm_virtual_network.vm_vnet.id
  source_vnet_name = module.aks_vnet.name
  vnet_peering_name = var.aks_peering_vm_name
}
