resource "azuredevops_environment" "poc-la-standard-terraform_development" {
  project_id = data.azuredevops_project.msft.id
  name       = "poc-la-standard-terraform-Development"
}

resource "azuredevops_environment" "poc-la-standard-terraform_test" {
  project_id = data.azuredevops_project.msft.id
  name       = "poc-la-standard-terraform-Test"
}

resource "azuredevops_environment" "poc-la-standard-terraform_production" {
  project_id = data.azuredevops_project.msft.id
  name       = "poc-la-standard-terraform-Production"
}

resource "azuredevops_variable_group" "poc-la-standard-terraform_development" {
  project_id   = data.azuredevops_project.msft.id
  name         = "poc-la-standard-terraform-Development"
  description  = "poc-la-standard-terraform-Development"
  allow_access = true

  variable {
    name  = "AZURE_SUBSCRIPTION_ID"
    value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
  }

  variable {
    name  = "tf_backend_subscription_id"
    value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
  }

  variable {
    name  = "tf_backend_resource_group_name"
    value = "rg-tf-poc-la-standard-terraform-poc-uksouth"
  }

  variable {
    name  = "tf_backend_storage_account_name"
    value = format("sa%s", random_id.storage_account_name["poc-la-standard-terraform"].hex)
  }

  variable {
    name  = "tf_backend_container_name"
    value = "tfstate"
  }

  variable {
    name  = "tf_backend_key"
    value = "development.tfstate"
  }

  variable {
    name         = "AZURE_CLIENT_ID"
    secret_value = azuread_application.workload["poc-la-standard-terraform"].application_id
    is_secret    = true
  }
}

resource "azuredevops_variable_group" "poc-la-standard-terraform_test" {
  project_id   = data.azuredevops_project.msft.id
  name         = "poc-la-standard-terraform-Test"
  description  = "poc-la-standard-terraform-Test"
  allow_access = true

  variable {
    name  = "AZURE_SUBSCRIPTION_ID"
    value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
  }

  variable {
    name  = "tf_backend_subscription_id"
    value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
  }

  variable {
    name  = "tf_backend_resource_group_name"
    value = "rg-tf-poc-la-standard-terraform-poc-uksouth"
  }

  variable {
    name  = "tf_backend_storage_account_name"
    value = format("sa%s", random_id.storage_account_name["poc-la-standard-terraform"].hex)
  }

  variable {
    name  = "tf_backend_container_name"
    value = "tfstate"
  }

  variable {
    name  = "tf_backend_key"
    value = "test.tfstate"
  }

  variable {
    name         = "AZURE_CLIENT_ID"
    secret_value = azuread_application.workload["poc-la-standard-terraform"].application_id
    is_secret    = true
  }
}

resource "azuredevops_variable_group" "poc-la-standard-terraform_production" {
  project_id   = data.azuredevops_project.msft.id
  name         = "poc-la-standard-terraform-Production"
  description  = "poc-la-standard-terraform-Production"
  allow_access = true

  variable {
    name  = "AZURE_SUBSCRIPTION_ID"
    value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
  }

  variable {
    name  = "tf_backend_subscription_id"
    value = "ecc74148-1a84-4ec7-99bb-d26aba7f9c0d"
  }

  variable {
    name  = "tf_backend_resource_group_name"
    value = "rg-tf-poc-la-standard-terraform-poc-uksouth"
  }

  variable {
    name  = "tf_backend_storage_account_name"
    value = format("sa%s", random_id.storage_account_name["poc-la-standard-terraform"].hex)
  }

  variable {
    name  = "tf_backend_container_name"
    value = "tfstate"
  }

  variable {
    name  = "tf_backend_key"
    value = "production.tfstate"
  }

  variable {
    name         = "AZURE_CLIENT_ID"
    secret_value = azuread_application.workload["poc-la-standard-terraform"].application_id
    is_secret    = true
  }
}

resource "azuredevops_resource_authorization" "poc-la-standard-terraform_development" {
  project_id  = data.azuredevops_project.msft.id
  resource_id = azuredevops_variable_group.poc-la-standard-terraform_development.id
  authorized  = true

  type = "variablegroup"
}

resource "azuredevops_resource_authorization" "poc-la-standard-terraform_test" {
  project_id  = data.azuredevops_project.msft.id
  resource_id = azuredevops_variable_group.poc-la-standard-terraform_test.id
  authorized  = true

  type = "variablegroup"
}

resource "azuredevops_resource_authorization" "poc-la-standard-terraform_production" {
  project_id  = data.azuredevops_project.msft.id
  resource_id = azuredevops_variable_group.poc-la-standard-terraform_production.id
  authorized  = true

  type = "variablegroup"
}
