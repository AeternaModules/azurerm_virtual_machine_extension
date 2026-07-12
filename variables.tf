variable "virtual_machine_extensions" {
  description = <<EOT
Map of virtual_machine_extensions, attributes below
Required:
    - name
    - publisher
    - type
    - type_handler_version
    - virtual_machine_id
Optional:
    - auto_upgrade_minor_version
    - automatic_upgrade_enabled
    - failure_suppression_enabled
    - protected_settings
    - protected_settings_key_vault_id (alternative to protected_settings - read from Key Vault instead)
    - protected_settings_key_vault_secret_name (alternative to protected_settings - read from Key Vault instead)
    - provision_after_extensions
    - settings
    - tags
    - protected_settings_from_key_vault (block):
        - secret_url (required)
        - source_vault_id (required)
EOT

  type = map(object({
    name                                     = string
    publisher                                = string
    type                                     = string
    type_handler_version                     = string
    virtual_machine_id                       = string
    auto_upgrade_minor_version               = optional(bool)
    automatic_upgrade_enabled                = optional(bool)
    failure_suppression_enabled              = optional(bool) # Default: false
    protected_settings                       = optional(string)
    protected_settings_key_vault_id          = optional(string)
    protected_settings_key_vault_secret_name = optional(string)
    provision_after_extensions               = optional(list(string))
    settings                                 = optional(string)
    tags                                     = optional(map(string))
    protected_settings_from_key_vault = optional(object({
      secret_url      = string
      source_vault_id = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.virtual_machine_extensions : (
        v.provision_after_extensions == null || (length(v.provision_after_extensions) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_virtual_machine_extension's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: virtual_machine_id
  #   source:    [from commonids.ValidateVirtualMachineID] !ok
  # path: virtual_machine_id
  #   source:    [from commonids.ValidateVirtualMachineID] err != nil
  # path: settings
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: protected_settings
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

