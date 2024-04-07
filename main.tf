resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = "${var.resource_group_name_prefix}-${var.project_name}"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location                         = azurerm_resource_group.rg.location
  name                             = "${var.project_name}-cluster"
  resource_group_name              = azurerm_resource_group.rg.name
  dns_prefix                       = "${var.project_name}-dns"
  http_application_routing_enabled = var.application_routing_enabled

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = "Standard_D2_v2"
    node_count = var.node_count
    upgrade_settings {
      max_surge = "10%"
    }
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}
