terraform {
  required_version = ">= 1.2.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.0"
    }    
  }
}

provider "azurerm" {
  features {}
}
