resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = "${var.project_name}-aks-key"
  location  = var.location
  parent_id = var.create_rg ? azurerm_resource_group.rg[0].id : data.azurerm_resource_group.existing_rg[0].id
}

resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey", "privateKey"]
}

resource "local_sensitive_file" "private_key" {
  content         = jsondecode(azapi_resource_action.ssh_public_key_gen.output).privateKey
  filename        = "${azurerm_kubernetes_cluster.k8s.name}.pem"
  file_permission = "0600"
}

output "key_data" {
  value = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
}
