resource "azurerm_resource_group" "RG" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "ACC" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.RG.name
  location                 = azurerm_resource_group.RG.location
  account_tier             = var.storage_account_account_tier
  account_replication_type = var.storage_account_account_replication_type

  tags = {
    environment = var.storage_account_environment
  }
}

resource "azurerm_storage_container" "SCON" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.ACC.name
  container_access_type = var.storage_container_container_access_type
}
data "azurerm_storage_blob" "BLOB" {
  name                   = var.storage_blob_name
  storage_account_name   = var.storage_blob_storage_account_name
  storage_container_name = var.storage_blob_storage_container_name
}