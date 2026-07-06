output "virtual_machine_extensions" {
  description = "All virtual_machine_extension resources"
  value       = azurerm_virtual_machine_extension.virtual_machine_extensions
  sensitive   = true
}
output "virtual_machine_extensions_auto_upgrade_minor_version" {
  description = "List of auto_upgrade_minor_version values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.auto_upgrade_minor_version]
}
output "virtual_machine_extensions_automatic_upgrade_enabled" {
  description = "List of automatic_upgrade_enabled values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.automatic_upgrade_enabled]
}
output "virtual_machine_extensions_failure_suppression_enabled" {
  description = "List of failure_suppression_enabled values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.failure_suppression_enabled]
}
output "virtual_machine_extensions_name" {
  description = "List of name values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.name]
}
output "virtual_machine_extensions_protected_settings" {
  description = "List of protected_settings values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.protected_settings]
  sensitive   = true
}
output "virtual_machine_extensions_protected_settings_from_key_vault" {
  description = "List of protected_settings_from_key_vault values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.protected_settings_from_key_vault]
}
output "virtual_machine_extensions_provision_after_extensions" {
  description = "List of provision_after_extensions values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.provision_after_extensions]
}
output "virtual_machine_extensions_publisher" {
  description = "List of publisher values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.publisher]
}
output "virtual_machine_extensions_settings" {
  description = "List of settings values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.settings]
}
output "virtual_machine_extensions_tags" {
  description = "List of tags values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.tags]
}
output "virtual_machine_extensions_type" {
  description = "List of type values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.type]
}
output "virtual_machine_extensions_type_handler_version" {
  description = "List of type_handler_version values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.type_handler_version]
}
output "virtual_machine_extensions_virtual_machine_id" {
  description = "List of virtual_machine_id values across all virtual_machine_extensions"
  value       = [for k, v in azurerm_virtual_machine_extension.virtual_machine_extensions : v.virtual_machine_id]
}

