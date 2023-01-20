data "github_repository" "frasermolyneux-poc-terraform-template" {
  full_name = "frasermolyneux/poc-terraform-template"
}

// POC

resource "github_repository_environment" "frasermolyneux-poc-terraform-template_poc" {
  environment = "POC"
  repository  = data.github_repository.frasermolyneux-poc-terraform-template.name
}

resource "github_actions_environment_secret" "frasermolyneux-poc-terraform-template_poc_azure-client-id" {
  repository      = data.github_repository.frasermolyneux-poc-terraform-template.name
  environment     = github_repository_environment.frasermolyneux-poc-terraform-template_poc.environment
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = azuread_application.spn-github-poc-terraform-template-poc.application_id
}

resource "github_actions_environment_secret" "frasermolyneux-poc-terraform-template_poc_azure-subscription-id" {
  repository      = data.github_repository.frasermolyneux-poc-terraform-template.name
  environment     = github_repository_environment.frasermolyneux-poc-terraform-template_poc.environment
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
}

resource "github_actions_environment_secret" "frasermolyneux-poc-terraform-template_poc_azure-tenant-id" {
  repository      = data.github_repository.frasermolyneux-poc-terraform-template.name
  environment     = github_repository_environment.frasermolyneux-poc-terraform-template_poc.environment
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = data.azuread_client_config.current.tenant_id
}
