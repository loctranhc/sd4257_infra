variable "acr_vnet_name" {
  type = string
}

variable "acr_address_space" {
  type = list(string)
}

variable "acr_subnet_name" {
  type = string
}

variable "acr_address_prefixs" {
  type = list(string)
}

variable "acr_private_link_name" {
  type = string
}

variable "acr_private_dns_zone_name" {
  type    = string
  default = "privatelink.azurecr.io"
}

variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type = string
}

variable "acr_pep_name" {
  type = string
}

variable "acr_service_connection_name" {
  type = string
}

variable "acr_subresource_names" {
  type = list(string)
}

variable "vm_peering_acr_name" {
  type = string
}

variable "acr_peering_vm_name" {
  type = string
}
