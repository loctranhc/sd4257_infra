resource "azurerm_kubernetes_cluster" "aks_cluster" {
  location                = var.rg_location
  resource_group_name     = var.rg_name
  name                    = var.aks_cluster_name
  dns_prefix              = var.dns_prefix
  private_cluster_enabled = var.private_cluster_enabled
  sku_tier                = var.sku_tier

  identity {
    type = var.identity_type
  }

  default_node_pool {
    name           = var.default_node_pool_name
    vm_size        = var.vm_size
    node_count     = var.default_node_count
    vnet_subnet_id = var.vnet_subnet_id
    os_sku         = var.os_sku
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }
}
