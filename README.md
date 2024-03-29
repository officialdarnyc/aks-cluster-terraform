# Terraform code for Azure Kubernetes Service (AKS) Cluster

This repository contains Terraform code for deploying an Azure Kubernetes Service (AKS) cluster.

## Prerequisites

Before you can deploy the AKS cluster using this Terraform code, make sure you have the following prerequisites:

- Azure subscription
- Azure CLI installed
- Terraform installed

## Getting Started

To get started, follow these steps:

1. Create an Azure service principal:

    ```bash
    az ad sp create-for-rbac --name <service_principal_name> --role Contributor --scopes /subscriptions/<subscription_id>
    ```

2. Specify the crdentials to Terraform via environment variables:

    ```bash
    export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
    export ARM_TENANT_ID="<azure_subscription_tenant_id>"
    export ARM_CLIENT_ID="<service_principal_appid>"
    export ARM_CLIENT_SECRET="<service_principal_password>"
    ```

3. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/officialdarnyc/aks-cluster-terraform.git
    ```

4. Change into the cloned directory:

    ```bash
    cd aks-cluster-terraform
    ```

5. Initialize Terraform:

    ```bash
    terraform init
    ```

6. Modify the `variables.tf` file to customize the AKS cluster configuration.

7. Review the `main.tf` file to ensure it matches your requirements.

8. Plan the deployment to see the changes that will be made:

    ```bash
    terraform plan -out=aks.tfplan
    ```

9. Provision the AKS cluster without prompting for confirmation:

    ```bash
    terraform apply -auto-approve aks.tfplan
    ```

10. After the provisioning is complete, you can access your AKS cluster using the Azure CLI:

    ```bash
    az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
    ```

## Clean Up

To clean up and delete the AKS cluster, run the following command:

    
    terraform destroy -auto-approve
    
