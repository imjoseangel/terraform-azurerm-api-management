#-------------------------------
# Local Declarations
#-------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.main[*].name, azurerm_resource_group.main[*].name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.main[*].location, azurerm_resource_group.main[*].location, [""]), 0)
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#---------------------------------------------------------
data "azurerm_resource_group" "main" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "main" {
  #ts:skip=AC_AZURE_0389 RSG lock should be skipped for now.
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = merge({ "ResourceName" = format("%s", var.resource_group_name) }, var.tags, )
}

#---------------------------------------------------------
# Public IP Creation or selection
#---------------------------------------------------------

resource "azurerm_public_ip" "main" {
  name                = var.public_ip_name
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  zones               = var.public_ip_zones
  domain_name_label   = var.public_ip_domain_name_label
  sku                 = var.public_ip_sku

  tags = merge({ "ResourceName" = lower(var.public_ip_name) }, var.tags, )
}

#---------------------------------------------------------
# APIM Creation or selection
#---------------------------------------------------------

resource "azurerm_api_management" "main" {
  name                          = var.name
  location                      = local.location
  resource_group_name           = local.resource_group_name
  publisher_name                = var.publisher_name
  publisher_email               = var.publisher_email
  sku_name                      = var.sku_name
  zones                         = var.zones
  virtual_network_type          = var.virtual_network_type
  public_network_access_enabled = var.public_network_access_enabled
  public_ip_address_id          = azurerm_public_ip.main.id

  dynamic "virtual_network_configuration" {
    for_each = var.vnet_subnet_id == null ? [] : ["virtual_network_configuration"]
    content {
      subnet_id = var.vnet_subnet_id
    }
  }

  identity {
    type         = var.identity_type
    identity_ids = var.user_assigned_identity_id
  }

  sign_in {
    enabled = var.sign_in_enabled
  }

  tags = merge({ "ResourceName" = lower(var.name) }, var.tags, )
}
