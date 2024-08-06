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

  private_dns_zone_group {
    name                 = ""
    private_dns_zone_ids = []
  }

  private_dns_zone_group {
    name                 = "omerf-acr-dns-zone-group"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}