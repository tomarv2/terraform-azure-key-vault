resource "azurerm_key_vault_secret" "main" {
  for_each = var.secrets

  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.kv.id
  tags         = merge(local.shared_tags)
}
