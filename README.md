<p align="center">
    <a href="https://github.com/tomarv2/terraform-azure-key-vault/actions/workflows/security_scans.yml" alt="Security Scans">
        <img src="https://github.com/tomarv2/terraform-azure-key-vault/actions/workflows/security_scans.yml/badge.svg?branch=main" /></a>
    <a href="https://www.apache.org/licenses/LICENSE-2.0" alt="license">
        <img src="https://img.shields.io/github/license/tomarv2/terraform-azure-key-vault" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-key-vault/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-key-vault" /></a>
    <a href="https://github.com/tomarv2/terraform-azure-key-vault/pulse" alt="Activity">
        <img src="https://img.shields.io/github/commit-activity/m/tomarv2/terraform-azure-key-vault" /></a>
    <a href="https://stackoverflow.com/users/6679867/tomarv2" alt="Stack Exchange reputation">
        <img src="https://img.shields.io/stackexchange/stackoverflow/r/6679867"></a>
    <a href="https://discord.gg/XH975bzN" alt="chat on Discord">
        <img src="https://img.shields.io/discord/813961944443912223?logo=discord"></a>
    <a href="https://twitter.com/intent/follow?screen_name=varuntomar2019" alt="follow on Twitter">
        <img src="https://img.shields.io/twitter/follow/varuntomar2019?style=social&logo=twitter"></a>
</p>

# Terraform module to create [Azure Key Vault](https://registry.terraform.io/modules/tomarv2/key-vault/azure/latest)

> :arrow_right: Terraform module to create [AWS Parameterstore](https://registry.terraform.io/modules/tomarv2/parameterstore/aws/latest)

> :arrow_right: Terraform module to create [Google Secret Manager](https://registry.terraform.io/modules/tomarv2/secret-manager/google/latest)

## Versions

- Module tested for Terraform 0.14.
- Azure provider version [2.48.0](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use <a href="https://github.com/tomarv2/terraform-azure-key-vault/tags" alt="GitHub tag">
        <img src="https://img.shields.io/github/v/tag/tomarv2/terraform-azure-key-vault" /></a> in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote)

## Usage

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_AZURE_STORAGE_ACCOUNT=tfstatexxxxx # Output of remote_state.sh
export TF_AZURE_CONTAINER=tfstate # Output of remote_state.sh
export ARM_ACCESS_KEY=xxxxxxxxxx # Output of remote_state.sh
```  

- Make required change to `examples` directory 

- Run and verify the output before deploying:
```
tf -cloud azure plan  -var='teamid=foo' -var='prjid=bar' -var "subscription_id=<>" -var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

- Run below to deploy:
```
tf -cloud azure apply  -var='teamid=foo' -var='prjid=bar' -var "subscription_id=<>" -var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

- Run below to destroy:
```
tf -cloud azure destroy  -var='teamid=foo' -var='prjid=bar' -var "subscription_id=<>" -var "client_id=<>" -var "client_secret=<>" -var "tenant_id=<>"
```

> ❗️ **Important** - Two variables are required for using `tf` package:
>
> - teamid
> - prjid
>
> These variables are required to set backend path in the remote storage.
> Variables can be defined using:
>
> - As `inline variables` e.g.: `-var='teamid=demo-team' -var='prjid=demo-project'`
> - Inside `.tfvars` file e.g.: `-var-file=<tfvars file location> `
>
> For more information refer to [Terraform documentation](https://www.terraform.io/docs/language/values/variables.html)

#### Azure Key Vault
```
module "keyvault" {
  source = "git::git@github.com:tomarv2/terraform-azure-key-vault.git?ref=v0.0.1"

  client_id       = var.client_id
  subscription_id = var.subscription_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  rg_name         = "test-rg"
  secrets = {
    hello   = "hello"
    foo = "bar"
  }
  user_object_id_list = ["12345-1234-1234-1234-1234567"]
  #-----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
```

Note: If no `user_object_id_list` is specified, the service account creating the key-vault will get access to the key.

Please refer to examples directory [link](examples) for references.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| azurerm | ~> 2.48 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 2.48 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_policies | List of access policies for the Key Vault. | `any` | `[]` | no |
| client\_id | n/a | `any` | n/a | yes |
| client\_secret | n/a | `any` | n/a | yes |
| enabled\_for\_disk\_encryption | Allow Disk Encryption to retrieve secrets from the vault and unwrap keys. | `bool` | `false` | no |
| key\_premissions | TODO: what happens when different users need different permissions | `list(string)` | <pre>[<br>  "get",<br>  "list",<br>  "create"<br>]</pre> | no |
| network\_default\_action | n/a | `string` | `"Deny"` | no |
| network\_ip\_allowed | n/a | `list(string)` | `null` | no |
| prjid | Name of the project/stack. NOTE: DONOT CHANGE ONCE SET | `any` | n/a | yes |
| purge\_protection\_enabled | n/a | `bool` | `false` | no |
| rg\_location | n/a | `string` | `"eastus"` | no |
| rg\_name | n/a | `any` | n/a | yes |
| secret\_permissions | n/a | `list(string)` | <pre>[<br>  "set",<br>  "list",<br>  "get",<br>  "delete"<br>]</pre> | no |
| secrets | A map of secrets for the Key Vault. | `map(string)` | `{}` | no |
| sku | The name of the SKU used for the Key Vault. The options are: `standard`, `premium`. | `string` | `"standard"` | no |
| storage\_permissions | n/a | `list(string)` | <pre>[<br>  "set",<br>  "list",<br>  "get"<br>]</pre> | no |
| subscription\_id | n/a | `any` | n/a | yes |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| tenant\_id | n/a | `any` | n/a | yes |
| user\_object\_id\_list | n/a | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Key Vault. |
| name | The name of the Key Vault. |
| references | A mapping of Key Vault references for App Service and Azure Functions. |
| secrets | A mapping of secret names and URIs. |
| uri | The URI of the Key Vault. |
