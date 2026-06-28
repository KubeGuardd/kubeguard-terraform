# KubeGuard Terraform GitHub Actions Setup

Complete these steps once, in order, before running the pipeline.

## Step 1 - Create the tfstate container in Azure Blob Storage

Run this once after the storage account has been created by Terraform:

```bash
az storage container create \
  --name tfstate \
  --account-name kubeguardstg \
  --auth-mode login
```

## Step 2 - Create App Registration

```bash
az ad app create --display-name "kubeguard-terraform-oidc"
```

Save the output `appId` as `<APP_ID>`.

## Step 3 - Create Service Principal

```bash
az ad sp create --id <APP_ID>
```

## Step 4 - Assign Contributor role on subscription

```bash
az role assignment create \
  --assignee <APP_ID> \
  --role "Contributor" \
  --scope "/subscriptions/<YOUR_SUBSCRIPTION_ID>"
```

The Terraform configuration creates AKS role assignments. Grant the identity
permission to manage Azure RBAC assignments:

```bash
az role assignment create \
  --assignee <APP_ID> \
  --role "User Access Administrator" \
  --scope "/subscriptions/<YOUR_SUBSCRIPTION_ID>"
```

## Step 5 - Assign Storage Blob Data Contributor role

This role permits Terraform to read, write, and lock remote state:

```bash
az role assignment create \
  --assignee <APP_ID> \
  --role "Storage Blob Data Contributor" \
  --scope "/subscriptions/<YOUR_SUBSCRIPTION_ID>/resourceGroups/kubeguard-rg/providers/Microsoft.Storage/storageAccounts/kubeguardstg"
```

## Step 6 - Create Federated Credential for dev branch

```bash
az ad app federated-credential create \
  --id <APP_ID> \
  --parameters '{
    "name": "kubeguard-dev-branch",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:KubeGuardd/kubeguard-terraform:ref:refs/heads/dev",
    "audiences": ["api://AzureADTokenExchange"]
  }'
```

## Step 7 - Create Federated Credential for main branch

```bash
az ad app federated-credential create \
  --id <APP_ID> \
  --parameters '{
    "name": "kubeguard-main-branch",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:KubeGuardd/kubeguard-terraform:ref:refs/heads/main",
    "audiences": ["api://AzureADTokenExchange"]
  }'
```

## Step 8 - Create Federated Credential for pull requests

```bash
az ad app federated-credential create \
  --id <APP_ID> \
  --parameters '{
    "name": "kubeguard-pull-request",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:KubeGuardd/kubeguard-terraform:pull_request",
    "audiences": ["api://AzureADTokenExchange"]
  }'
```

## Step 9 - Add GitHub Secrets

Go to <https://github.com/KubeGuardd/kubeguard-terraform/settings/secrets/actions>
and add:

- `AZURE_CLIENT_ID` = `<APP_ID>`
- `AZURE_TENANT_ID` = output of `az account show --query tenantId -o tsv`
- `AZURE_SUBSCRIPTION_ID` = output of `az account show --query id -o tsv`

Do not create an `ARM_CLIENT_SECRET`; authentication uses OIDC.

## Step 10 - Create GitHub Environment for prod approval

Go to <https://github.com/KubeGuardd/kubeguard-terraform/settings/environments>:

- Create an environment named exactly `prod`.
- Enable **Required reviewers** and add your GitHub username.
- Save the protection rules.

## Step 11 - Important Order of Operations

```text
1. Run: terraform apply (first time, to create kubeguardstg storage account)
2. Run: Step 1 above (create tfstate container)
3. Add backend block to versions.tf (already done - versions.tf is ready)
4. Run: terraform init -backend-config="key=dev/kubeguard.terraform.tfstate" -migrate-state
5. Push to dev branch - pipeline takes over from here
```
