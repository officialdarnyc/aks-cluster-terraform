# Terraform code for Azure Kubernetes Service (AKS) Cluster

This repository contains Terraform code for deploying an Azure Kubernetes Service (AKS) cluster.

## Prerequisites

Before you can deploy the AKS cluster using this Terraform code, make sure you have the following prerequisites:

- Azure subscription
- Azure CLI installed
- Terraform installed

## Getting Started

To get started, follow these steps:

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/officialdarnyc/aks-cluster-terraform.git
    ```

2. Change into the cloned directory:

    ```bash
    cd aks-cluster-terraform
    ```

3. Initialize Terraform:

    ```bash
    terraform init
    ```

4. Modify the `variables.tf` file to customize the AKS cluster configuration.

5. Review the `main.tf` file to ensure it matches your requirements.

6. Plan the deployment to see the changes that will be made:

    ```bash
    terraform plan -out=aks.tfplan
    ```

7. Provision the AKS cluster without prompting for confirmation:

    ```bash
    terraform apply -auto-approve aks.tfplan
    ```

8. After the provisioning is complete, you can access your AKS cluster using the Azure CLI:

    ```bash
    az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>
    ```

## Clean Up

To clean up and delete the AKS cluster, run the following command:

    ```bash
    terraform destroy -auto-approve
    ```
