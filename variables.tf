variable "location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "create_rg" {
  type        = bool
  default     = true
  description = "Determine if resource group should be created or not"
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "rg_name" {
  type        = string
  default     = null
  description = "Name of Existing resource group to be used"
}

variable "project_name" {
  type        = string
  default     = "lbu-petclinic"
  description = "The name of the project."

}

variable "node_pool_name" {
  type        = string
  description = "The name of the node pool."
  default     = "workerpool"
}

variable "vm_size" {
  type        = string
  description = "The size of the Virtual Machine in the worker nodes"
  default     = "Standard_E2_v3"
}

variable "node_count" {
  type        = number
  description = "The quantity of nodes for the worker node pool."
  default     = 2
}

variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "application_routing_enabled" {
  type        = bool
  description = "Enable or disable the HTTP application routing addon. The add-on uses a Kubernetes CRD called NginxIngressController"
  default     = false

}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}
