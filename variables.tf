variable "name" {
  description = "Name of Azure API Management service."
  type        = string
}

variable "create_resource_group" {
  description = "Whether to create resource group and use it for all resources"
  default     = true
  type        = bool
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "rg-demo-westeurope-01"
  type        = string
}

variable "location" {
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "westeurope"
  type        = string
}

variable "sku_name" {
  type        = string
  description = "String consisting of two parts separated by an underscore. The fist part is the name, valid values include: Developer, Basic, Standard and Premium. The second part is the capacity"
  default     = "Developer_1"
}

variable "publisher_name" {
  type        = string
  description = "The name of publisher/company."
  default     = "MyCompany"
}

variable "publisher_email" {
  type        = string
  description = "The email of publisher/company."
  default     = "none@example.com"
}

variable "zones" {
  type        = list(number)
  description = "(Optional) Specifies a list of Availability Zones in which this API Management service should be located. Changing this forces a new API Management service to be created. Supported in Premium Tier."
  default     = []
}

variable "virtual_network_type" {
  type        = string
  description = "The type of virtual network you want to use, valid values include: None, External, Internal."
  default     = "Internal"
}

variable "vnet_subnet_id" {
  description = "(Optional) The ID of a Subnet where the API Manager Service should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "(Optional) Is public access to the service allowed?. Defaults to true"
  type        = bool
  default     = true
}

variable "public_ip_name" {
  description = "Name of Azure Public IP."
  type        = string
}


variable "public_ip_allocation_method" {
  description = " (Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type        = string
  default     = "Static"
}


variable "public_ip_zones" {
  type        = list(number)
  description = "(Optional) A collection containing the availability zone to allocate the Public IP in. Changing this forces a new resource to be created."
  default     = [1, 2, 3]
}

variable "public_ip_domain_name_label" {
  description = "Name of Azure Public IP Domain Name."
  type        = string
}

variable "public_ip_sku" {
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Standard. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "identity_type" {
  description = "Type type of identity used for the managed cluster. Possible values are 'SystemAssigned' and 'UserAssigned'. If 'UserAssigned' is set, a 'user_assigned_identity_id' must be set as well."
  type        = string
  default     = "UserAssigned"
}

variable "user_assigned_identity_id" {
  description = "(Optional) the ID of a user assigned identity"
  type        = list(string)
  default     = null
}

variable "sign_in_enabled" {
  description = "(Required) Should anonymous users be redirected to the sign in page?"
  default     = true
  type        = bool
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
