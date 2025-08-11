data "azuread_users" "owners" {
  user_principal_names = var.owners
}

data "azuread_user" "user_id" {
  for_each            = toset(var.member_id)
  user_principal_name = each.key
}

resource "azuread_group" "this" {
  display_name            = var.group_name
  owners                  = data.azuread_users.owners.object_ids
  security_enabled        = var.security_enabled
  assignable_to_role      = var.assignable_to_role
  prevent_duplicate_names = true
  types                   = var.group_type

  dynamic "dynamic_membership" {
    for_each = var.group_type != [] ? var.group_type : null
    content {
      enabled = true
      rule    = var.dynamic_membership_rule
    }
  }
}

resource "azuread_group_member" "this" {
  for_each         = var.member_id == [] ? [] : toset(var.member_id)
  group_object_id  = azuread_group.this.object_id
  member_object_id = data.azuread_user.user_id[each.value].object_id
}