resource "azuread_application" "poc_terraform_connections" {
  display_name = "spn-poc-terraform-connections-readonly-poc"

  owners = [
    data.azuread_client_config.current.object_id
  ]

  sign_in_audience = "AzureADMyOrg"
}

resource "azuread_service_principal" "poc_terraform_connections" {
  client_id                     = azuread_application.poc_terraform_connections.client_id
  app_role_assignment_required  = false

  owners = [
    data.azuread_client_config.current.object_id
  ]
}

resource "azuread_application_federated_identity_credential" "poc_terraform_connections" {
  application_id        = azuread_application.poc_terraform_connections.id
  display_name          = "github-poc-terraform-connections-readonly-poc"
  description           = "GitHub Actions"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:frasermolyneux/poc-terraform-connections:environment:POC"
}

resource "github_actions_environment_secret" "poc_terraform_connections_readonly_client_id" {
  repository      = github_repository.workload["poc-terraform-connections"].name
  environment     = github_repository_environment.workload["poc-terraform-connections"].environment
  secret_name     = "AZURE_READONLY_CLIENT_ID"
  plaintext_value = azuread_application.poc_terraform_connections.client_id
}

// This is a key part of the poc-terraform-connections proof of concept. What is the minimim set of permissions that can be set against the subscription to allow for terraform plan?
resource "azurerm_role_assignment" "poc_terraform_connections_reader" {
  scope                = "/subscriptions/ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
  role_definition_name = "Reader"
  principal_id         = azuread_service_principal.poc_terraform_connections.object_id
}

// This is a key part of the poc-terraform-connections proof of concept. What is the minimim set of permissions that can be set against AAD to allow for terraform plan?
resource "azuread_directory_role_assignment" "poc_terraform_connections_directory_readers" {
  role_id             = azuread_directory_role.builtin["Directory Readers"].template_id
  principal_object_id = azuread_service_principal.poc_terraform_connections.object_id
}

// This is a key part of the poc-terraform-connections proof of concept. What is the minimim set of permissions that can be set against a storage account to allow for terraform plan?
resource "azurerm_role_assignment" "poc_terraform_connections_storage_contributor" {
  scope                = azurerm_storage_account.workload["poc-terraform-connections"].id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.poc_terraform_connections.object_id
}