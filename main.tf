
provider "azurerm" {
  version = "~>1.32.0"
  // use_msi = true
  // subscription_id = ""
  // tenant_id       = ""
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "eastus"

  tags = {
    environment = "TF sandbox"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}
