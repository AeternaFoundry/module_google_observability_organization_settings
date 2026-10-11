resource "google_observability_organization_settings" "observability_organization_settings" {
  for_each = var.observability_organization_settings

  location                 = each.value.location
  organization             = each.value.organization
  default_storage_location = each.value.default_storage_location
  kms_key_name             = each.value.kms_key_name

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

