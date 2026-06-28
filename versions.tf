terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "kubeguard-rg"
    storage_account_name = "kubeguardstg"
    container_name       = "tfstate"
    use_oidc             = true
    use_azuread_auth     = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.110.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}
