/**
 * # Azure Role Assignment
 *
 * Azure role assignment grants specific permissions to users, groups, or applications by assigning predefined or custom roles at various scopes (management group, subscription, resource group, or individual resource).
 */

resource "azurerm_role_assignment" "this" {
  for_each = var.role_assignments

  principal_id                     = each.value.principal_id
  scope                            = var.scope
  principal_type                   = each.value.principal_type
  role_definition_id               = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? each.value.role_definition_id_or_name : null
  role_definition_name             = strcontains(lower(each.value.role_definition_id_or_name), lower(local.role_definition_resource_substring)) ? null : each.value.role_definition_id_or_name
  skip_service_principal_aad_check = each.value.skip_service_principal_aad_check
}