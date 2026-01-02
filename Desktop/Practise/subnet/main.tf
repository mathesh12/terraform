resource "azurerm_subnet" "resourse1" {
  name                 = "private"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.0.0/23"]
}
resource "azurerm_subnet" "resourse2" {
  name                 = "public"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
}