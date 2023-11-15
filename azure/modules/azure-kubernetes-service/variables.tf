variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "identity_type" {
  type = string
  default = "SystemAssigned"
}

variable "default_node_pool_name" {
  type = string
  default = "agentpool"
}

variable "vm_size" {
  type = string
  default = "Standard_D4s_v3"
}

variable "default_node_count" {
  type = string
  default = 2
}

variable "network_plugin" {
  type = string
  default = "azure"
}

variable "vnet_subnet_id" {
  type = string
}

variable "private_cluster_enabled" {
  type = bool
  default = true
}

variable "load_balancer_sku" {
  type = string
  default = "standard"
}

variable "sku_tier" {
  type = string
  default = "Standard"
}

variable "os_sku" {
  type = string
  default = "Ubuntu"
}