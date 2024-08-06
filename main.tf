resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku

  public_network_access_enabled = false
  admin_enabled                 = false
}

resource "azurerm_private_endpoint" "acr_endpoint" {
  name                = "${var.name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-psc"
    private_connection_resource_id = azurerm_container_registry.acr.id
    is_manual_connection           = false
    subresource_names              = ["registry"]
  }
}

#resource "azurerm_private_dns_a_record" "acr_a_record" {
#  name                = azurerm_container_registry.acr.name
#  resource_group_name = var.resource_group_name
#  zone_name           = var.private_dns_zone_name
#  ttl                 = 300
#  records             = [azurerm_private_endpoint.acr_endpoint.private_service_connection[0].private_ip_address]
#}
