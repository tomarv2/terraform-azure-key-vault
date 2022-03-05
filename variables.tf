variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "Name of the project/stack. NOTE: DONOT CHANGE ONCE SET"
}

variable "rg_name" {}

variable "rg_location" {
  default = "eastus"
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
  type    = bool
  default = false
}

variable "access_policies" {
  type        = any
  description = "List of access policies for the Key Vault."
  default     = []
}

variable "network_default_action" {
  default = "Deny"
}

variable "network_ip_allowed" {
  type    = list(string)
  default = null
}

# TODO: what happens when different users need different permissions
variable "key_premissions" {
  type    = list(string)
  default = ["list", "get", "delete", "recover", "update", "backup", "purge", "import", "create", "verify", "restore"]
}

variable "secret_permissions" {
  type    = list(string)
  default = ["set", "list", "get", "delete", "recover", "backup", "purge", "restore"]
}

variable "storage_permissions" {
  type    = list(string)
  default = ["set", "list", "get"]
}

variable "user_object_id_list" {
  type    = list(string)
  default = []
}
