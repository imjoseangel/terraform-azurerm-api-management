# terraform-azurerm-applicationinsights

[![Terraform](https://github.com/imjoseangel/terraform-azurerm-applicationinsights/actions/workflows/terraform.yml/badge.svg)](https://github.com/imjoseangel/terraform-azurerm-applicationinsights/actions/workflows/terraform.yml)

## Deploys an Application Insights on Azure

This Terraform module deploys an Application Insights on Azure

### NOTES

* Log Analytics can be created on the side.

## Usage in Terraform 1.0

```terraform
module "insights" {
  source                               = "github.com/imjoseangel/terraform-azurerm-applicationinsights"
  name                                 = "myappinsights"
  resource_group_name                  = "rsg-insights"
  location                             = "westeurope"
  create_resource_group                = true
}
```

## Authors

Originally created by [imjoseangel](http://github.com/imjoseangel)

## License

[MIT](LICENSE)
