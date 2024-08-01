# Azure Container Registry (ACR) Terraform Module

This Terraform module deploys an Azure Container Registry (ACR) with a private endpoint and sets up necessary permissions for an Azure Kubernetes Service (AKS) cluster to pull images from the ACR. The module also configures a private DNS zone for the ACR.

## Usage

```hcl
module "acr" {
  source              = "./modules/terraform-azure-acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name            = "myacrname"
  sku                 = "Standard"
  subnet_id           = azurerm_subnet.my_subnet.id
  virtual_network_id  = azurerm_virtual_network.my_vnet.id
  aks_principal_id    = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "acr_login_server" {
  value = module.acr.acr_login_server
}
