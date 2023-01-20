resource "azuread_application" "spn-github-poc" {
  display_name = "spn-github-poc"

  owners = [
    data.azuread_client_config.current.object_id
  ]

  sign_in_audience = "AzureADMyOrg"
}

resource "azuread_service_principal" "spn-github-poc_service-principal" {
  application_id               = azuread_application.spn-github-poc.application_id
  app_role_assignment_required = false

  owners = [
    data.azuread_client_config.current.object_id
  ]
}

resource "azuread_application_federated_identity_credential" "spn-github-poc_federated-credential" {
  application_object_id = azuread_application.spn-github-poc.object_id
  display_name          = "github-frasermolyneux-poc-terraform-template"
  description           = "GitHub Actions"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:frasermolyneux/poc-terraform-template:environment:POC"
}
