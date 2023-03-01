terraform {
  required_version = ">= 1.3.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.35.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

data "azuread_client_config" "current" {}

resource "random_id" "environment_id" {
  byte_length = 6
}

resource "time_rotating" "rotate" {
  rotation_days = 30
}
