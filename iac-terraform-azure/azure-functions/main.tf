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
}

resource "azurerm_service_plan" "PLAN" {
  name                = var.service_plan_name
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  os_type             = var.service_plan_os_type
  sku_name            = var.service_plan_sku_name
}

resource "azurerm_linux_function_app" "APP" {
  name                = var.linux_function_app_name
  location            = azurerm_resource_group.RG.location
  resource_group_name = azurerm_resource_group.RG.name
  service_plan_id     = azurerm_service_plan.PLAN.id

  storage_account_name       = azurerm_storage_account.ACC.name
  storage_account_access_key = azurerm_storage_account.ACC.primary_access_key

  site_config {
    application_stack {
      python_version = var.application_stack_python_version
    }
  }
}

resource "azurerm_function_app_function" "APPF" {
  name            = var.function_app_function_name
  function_app_id = azurerm_linux_function_app.APP.id
  language        = var.function_app_function_language
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}