variable "aks_vnet_name" {
  type    = string
}

variable "aks_address_space" {
  type = list(string)
}

variable "aks_subnet_name" {
  type = string
}

variable "aks_address_prefixs" {
  type = list(string)
}

variable "aks_cluster_name" {
  type = string
}

variable "aks_dns_prefix" {
  type = string
}

variable "vm_peering_aks_name" {
  type = string
}

variable "aks_peering_vm_name" {
  type = string
}
