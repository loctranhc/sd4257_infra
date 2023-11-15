module "resource_group" {
  source = "../../modules/resource-group"

  rg_name     = var.rg_name
  rg_location = var.rg_location
}