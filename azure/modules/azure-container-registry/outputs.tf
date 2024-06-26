output "private_dns_zone_name" {
  value = "privatelink.azurecr.io"
}

output "id" {
  value = azurerm_container_registry.acr.id
}
