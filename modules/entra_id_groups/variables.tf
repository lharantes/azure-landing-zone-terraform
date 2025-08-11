variable "security_enabled" {
  type        = bool
  default     = true
  description = "Whether the group is a security group for controlling access to in-app resources"
}

variable "group_name" {
  type        = string
  description = "The display name for the group."
}

variable "assignable_to_role" {
  type        = bool
  default     = false
  description = "Indicates whether this group can be assigned to an Azure Active Directory role. Can only be set to true for security-enabled groups."
}

variable "owners" {
  type        = list(string)
  default     = []
  description = "A set of object IDs of principals that will be granted ownership of the group. Supported object types are users or service principals."
}

variable "group_type" {
  type    = list(string)
  default = []
  description = "A set of group types to configure for the group."
}

variable "dynamic_membership_rule" {
  type        = string
  default     = ""
  description = "Used when you want the group to be dynamic in Entra ID—that is, for membership to be automatically determined based on conditions and attributes of users or devices."
  # Example = "user.department -eq \"IT\""
}

variable "member_id" {
  type    = list(string)
  default = []
  description = "A set of members who should be present in this group. Supported object types are Users, Groups or Service Principals. Cannot be used with the dynamic_membership block."
}