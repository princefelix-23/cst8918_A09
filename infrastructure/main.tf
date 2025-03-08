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

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "cst8918-lab09"
  location = "Canada Central"
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "mystorageacct123"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}