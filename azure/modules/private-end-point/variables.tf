variable "pep_name" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "service_connection_name" {
  type = string
}

variable "resource_id" {
  type = string
}

variable "subresource_names" {
  type = list(string)
}

variable "private_dns_zone_id" {
  type = string
}

variable "private_dns_zone_group_name" {
  type = string
  default = "private-dns-zone-group"
}
