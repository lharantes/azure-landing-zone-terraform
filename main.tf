variable "subscription_id" {
  type    = string
  default = "52ede033-xxxx-xxxx-xxxx-xxxxxxxxx"
}

module "group_ti" {
  source = "./modules/entra_id_groups"

  group_name = "GRP-TI"
  owners     = ["luiz@arantes.net.br"]
  member_id  = ["luiz@arantes.net.br", "julia@arantes.net.br"]
}

module "subscription_assignment" {
  source = "./modules/az_role_assignment"

  scope = "/subscriptions/${var.subscription_id}"
  role_assignments = {
    subscription = {
      principal_id               = module.group_ti.group_objecti_id
      role_definition_id_or_name = "Reader"
    }
  }
}