variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources in"
  type        = string
}

variable "name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Premium"
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy the private endpoint in"
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of the virtual network to link the private DNS zone to"
  type        = string
}

variable "private_dns_zone_id" {
  description = "The Private dns zone id to associate the A record to it."
  type        = string
}
