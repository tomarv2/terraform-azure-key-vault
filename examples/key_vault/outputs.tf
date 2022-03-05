output "id" {
  value       = module.keyvault.id
  description = "The ID of the Key Vault."
}

output "name" {
  value       = module.keyvault.name
  description = "The name of the Key Vault."
}

output "uri" {
  value       = module.keyvault.uri
  description = "The URI of the Key Vault."
}

output "secrets" {
  value       = module.keyvault.id
  description = "A mapping of secret names and URIs."
}
