variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack. NOTE: DONOT CHANGE ONCE SET"
  type        = string
}

variable "resource_group" {
  description = "The name of the Resource group"
  type        = string
}

variable "secrets" {
  type        = map(string)
  description = "A map of secrets for the Key Vault."
  default     = {}
}

variable "sku" {
  type        = string
  description = "The name of the SKU used for the Key Vault. The options are: `standard`, `premium`."
  default     = "standard"
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Allow Disk Encryption to retrieve secrets from the vault and unwrap keys."
  default     = false
}

variable "purge_protection_enabled" {
  description = "Purge protection enabled"
  type        = bool
  default     = false
}

variable "network_default_action" {
  description = "Network default action"
  default     = "Deny"
  type        = string
}

# TODO: what happens when different users need different permissions
variable "key_premissions" {
  description = "Key permissions"
  type        = list(string)
  default     = ["list", "get", "delete", "recover", "update", "backup", "purge", "import", "create", "verify", "restore"]
}

variable "secret_permissions" {
  description = "Secret permissions"
  type        = list(string)
  default     = ["set", "list", "get", "delete", "recover", "backup", "purge", "restore"]
}

variable "storage_permissions" {
  description = "Storage permissions"
  type        = list(string)
  default     = ["set", "list", "get"]
}

variable "user_object_id_list" {
  description = "User object Id list"
  type        = list(string)
  default     = []
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  type        = string
  default     = "westus2"
}

variable "extra_tags" {
  description = "Additional tags to associate"
  type        = map(string)
  default     = {}
}
