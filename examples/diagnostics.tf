module "diagnostics_akv" {
  source  = ""
  version = "0.0.1"

  name                       = "resource_name"
  resource_id                = "resource_id"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  diag_object                = local.diagnostics_settings
}

locals = {
  diagnostics_settings = {
    log = [
      # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
      ["AuditEvent", true, true, 30],
      ["AzureSiteRecoveryJobs", true, true, 30],
    ]
    metric = [
      # ["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period]                 
      ["AllMetrics", true, true, 30],
    ]
  }
}

variable "log_analytics_workspace_id" {
  default = "kldjsflkjlkiujdew89677896y"
}
