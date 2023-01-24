resource "github_repository" "workload" {
  for_each = { for each in var.workloads : each.name => each }

  name        = each.value.name
  description = each.value.github.description
  topics      = each.value.github.topics

  visibility = each.value.github.visibility

  has_downloads = each.value.github.has_downloads
  has_issues    = each.value.github.has_issues
  has_projects  = each.value.github.has_projects
  has_wiki      = each.value.github.has_wiki

  vulnerability_alerts = true

  template {
    owner = "frasermolyneux"
    repository = "proof-of-concept-template"
  }
}

resource "azuread_application" "workload" {
  for_each = { for each in var.workloads : each.name => each }

  display_name = format("spn-%s-poc", lower(each.value.name))

  owners = [
    data.azuread_client_config.current.object_id
  ]

  sign_in_audience = "AzureADMyOrg"
}

resource "azuread_service_principal" "workload" {
  for_each = { for each in var.workloads : each.name => each }

  application_id               = azuread_application.workload[each.key].application_id
  app_role_assignment_required = false

  owners = [
    data.azuread_client_config.current.object_id
  ]
}

resource "azurerm_role_assignment" "owner" {
  for_each = { for each in var.workloads : each.name => each }

  scope                = "/subscriptions/ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
  role_definition_name = "Owner"
  principal_id         = azuread_service_principal.workload[each.value.name].object_id
}

resource "azuread_directory_role_assignment" "directory_writers" {
  for_each = { for each in var.workloads : each.name => each }

  role_id             = azuread_directory_role.builtin["Directory Writers"].template_id
  principal_object_id = azuread_service_principal.workload[each.value.name].object_id
}

resource "azuread_directory_role_assignment" "cloud_application_administrator" {
  for_each = { for each in var.workloads : each.name => each }

  role_id             = azuread_directory_role.builtin["Cloud application administrator"].template_id
  principal_object_id = azuread_service_principal.workload[each.value.name].object_id
}

resource "github_repository_environment" "workload" {
  for_each = { for each in var.workloads : each.name => each }

  environment = "POC"
  repository  = github_repository.workload[each.value.name].name
}

resource "github_actions_environment_secret" "client_id" {
  for_each = { for each in var.workloads : each.name => each }

  repository      = github_repository.workload[each.value.name].name
  environment     = github_repository_environment.workload[each.value.name].environment
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = azuread_application.workload[each.value.name].application_id
}

resource "github_actions_environment_secret" "subscription_id" {
  for_each = { for each in var.workloads : each.name => each }

  repository      = github_repository.workload[each.value.name].name
  environment     = github_repository_environment.workload[each.value.name].environment
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
}

resource "github_actions_environment_secret" "tenant_id" {
  for_each = { for each in var.workloads : each.name => each }

  repository      = github_repository.workload[each.value.name].name
  environment     = github_repository_environment.workload[each.value.name].environment
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = "76c09fbf-22c7-4ac4-9fdd-9f8f9c19e856"
}

// These really should be variables not secrets, can't see the terraform resource for that though
resource "github_actions_environment_secret" "tf_backend_subscription_id" {
  for_each = { for each in var.workloads : each.name => each }

  repository      = github_repository.workload[each.value.name].name
  environment     = github_repository_environment.workload[each.value.name].environment
  secret_name     = "tf_backend_subscription_id"
  plaintext_value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
}

resource "github_actions_environment_secret" "tf_backend_resource_group_name" {
  for_each = { for each in var.workloads : each.name => each }

  repository      = github_repository.workload[each.value.name].name
  environment     = github_repository_environment.workload[each.value.name].environment
  secret_name     = "tf_backend_resource_group_name"
  plaintext_value = format("rg-tf-%s-poc-uksouth", each.value.name)
}

resource "github_actions_environment_secret" "tf_backend_storage_account_name" {
  for_each = { for each in var.workloads : each.name => each }

  repository      = github_repository.workload[each.value.name].name
  environment     = github_repository_environment.workload[each.value.name].environment
  secret_name     = "tf_backend_storage_account_name"
  plaintext_value = format("sa%s", each.value.name)
}

resource "github_actions_environment_secret" "tf_backend_container_name" {
  for_each = { for each in var.workloads : each.name => each }

  repository      = github_repository.workload[each.value.name].name
  environment     = github_repository_environment.workload[each.value.name].environment
  secret_name     = "tf_backend_container_name"
  plaintext_value = "tfstate"
}

resource "github_actions_environment_secret" "tf_backend_key" {
  for_each = { for each in var.workloads : each.name => each }

  repository      = github_repository.workload[each.value.name].name
  environment     = github_repository_environment.workload[each.value.name].environment
  secret_name     = "tf_backend_key"
  plaintext_value = "terraform.tfstate"
}
