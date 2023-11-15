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