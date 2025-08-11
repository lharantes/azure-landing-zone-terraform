variable "scope" {
  type        = string
  description = <<DESCRIPTION
  The scope at which the Role Assignment applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM, or /providers/Microsoft.Management/managementGroups/myMG.
  DESCRIPTION
}

variable "role_assignments" {
  type = map(object({
    role_definition_id_or_name       = string
    principal_id                     = string
    description                      = optional(string, null)
    skip_service_principal_aad_check = optional(bool, false)
    principal_type                   = optional(string, null)
  }))
  default     = {}
  description = <<DESCRIPTION
A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.

- `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
- `principal_id` - The ID of the principal to assign the role to.
- `description` - The description of the role assignment.
- `skip_service_principal_aad_check` - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.

> Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.
DESCRIPTION
  nullable    = false
}