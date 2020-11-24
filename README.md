# terraform-azurerm-diagnostic_setting

```hcl
resource "azurerm_key_vault" "key_vault" {
    name                            = var.kv_name
    location                        = var.location
    resource_group                  = var.rg_name
    sku_name                        = var.sku    
    enabled_for_disk_encryption     = false
    enabled_for_deployment          = false
    enabled_for_template_deployment = false
    soft_delete_enabled             = true
    purge_protection_enabled        = true
    enable_rbac_authorization       = true
}

module "kv_diagnostic_settings" {
  source  = "andrewCluey/diagnostic_setting/azurerm"
  version = "0.0.3"

  diag_object                = local.diagnostics_settings
  log_analytics_workspace_id = var.la_workspace_id
  resource_id                = azurerm_key_vault.key_vault.id
  resource_name              = azurerm_key_vault.key_vault.name
}

locals {
    kv_diagnostics = {
        log = [
            # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
            ["AuditEvent", true, true, 14],
        ]
        metric = [
            #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]                 
            ["AllMetrics", true, true, 7],
        ]
    }
}

```