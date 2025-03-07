terraform {
  required_version = ">= 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "cst8918-lab-a09"
  location = "Canada Central"
}

resource "azurerm_storage_account" "storage" {
  name                     = "johnvinhcst8918storage"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
}