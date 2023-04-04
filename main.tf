module "global" {
  source = "github.com/tomarv2/terraform-global.git//common?ref=v0.0.1"
}

data "azurerm_client_config" "current" {}

# getting Service Principal object id of the account that is creating this resource
locals {
  acl_list = [
    data.azurerm_client_config.current.object_id
  ]
}

# create a single list of user(s)/application(s) by merging two list
locals {
  object_list = concat(local.acl_list, var.user_object_id_list)
}


resource "azurerm_key_vault" "kv" {
  name                        = "${var.teamid}-${var.prjid}"
  location                    = var.location
  resource_group_name         = var.resource_group
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = var.purge_protection_enabled
  sku_name                    = var.sku

  dynamic "access_policy" {
    for_each = local.object_list
    content {
      tenant_id           = data.azurerm_client_config.current.tenant_id
      object_id           = access_policy.value
      key_permissions     = var.key_premissions
      secret_permissions  = var.secret_permissions
      storage_permissions = var.storage_permissions
    }
  }

  network_acls {
    default_action = var.network_default_action
    bypass         = "AzureServices"
    ip_rules       = module.global.cidr_for_sec_grp_access
  }
  tags = merge(local.shared_tags, var.extra_tags)
}
