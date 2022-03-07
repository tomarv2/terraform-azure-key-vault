terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 2.98"
    }
  }
}

provider "azurerm" {
  features {}
}

module "key_vault" {
  source = "../../"

  resource_group_name = "test-rg"
  location            = var.location
  secrets = {
    hello = "hello"
    foo   = "bar"
  }
  user_object_id_list = ["12345-1234-1234-1234-1234567"]
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
