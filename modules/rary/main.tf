resource "azurerm_resource_group" "demo" {
   for_each = var.resource_groups
   name     = "${var.prefix}_${each.value}"
   location = var.region
   tags     = var.tags
}