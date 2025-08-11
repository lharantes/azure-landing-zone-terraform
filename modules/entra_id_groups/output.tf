output "group_objecti_id" {
  value       = azuread_group.this.object_id
  description = "Group object ID"
}

output "group_name" {
  value       = azuread_group.this.display_name
  description = "Group name"
}

output "user_id" {
  value = { for user_id in data.azuread_user.user_id : user_id.display_name => user_id.object_id }
}