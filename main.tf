terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.104.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "rg1" {
  name     = "example3"
  location = "West Europe"
}

resource "azurerm_resource_group" "rg2" {
 name     = "example2"
 location = "centralindia"
}



resource "azurerm_resource_group" "rg3" {
 name     = "example1"
 location = "centralindia"
}

resource "azurerm_virtual_network" "vnet1" {
  depends_on = [ azurerm_resource_group.rg1 ]
  name                = "example-network"
  location            = "West Europe"
  resource_group_name = "example3"
  address_space       = ["10.0.0.0/16"]
  # dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

   subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }
}
