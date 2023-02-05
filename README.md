# terraform-azurerm-api-managemenet

[![Terraform](https://github.com/imjoseangel/terraform-azurerm-api-management/actions/workflows/terraform.yml/badge.svg)](https://github.com/imjoseangel/terraform-azurerm-api-management/actions/workflows/terraform.yml)

## Deploys an API Management Service on Azure

This Terraform module deploys an API Management Service on Azure

### NOTES

* Log Analytics can be created on the side.

## Usage in Terraform 1.0

```terraform
module "apim" {
  source                               = "github.com/imjoseangel/terraform-azurerm-api-management"
  name                                 = "myapim"
  resource_group_name                  = "rsg-apim"
  location                             = "westeurope"
  create_resource_group                = true
}
```

## Authors

Originally created by [imjoseangel](http://github.com/imjoseangel)

## License

[MIT](LICENSE)
