resource "azurerm_resource_group" "terraform_state_resource_group" {
  name     = "rg-tf-poc"
  location = "UK South"
}

resource "azurerm_storage_account" "workload" {
  for_each = { for each in var.workloads : each.name => each if each.github.template_repository == "poc-terraform-template"}

  name                     = format("sa%s", random_id.storage_account_name[each.value.name].hex)
  resource_group_name      = azurerm_resource_group.terraform_state_resource_group.name
  location                 = azurerm_resource_group.terraform_state_resource_group.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = merge(var.tags, {
    Workload = each.value.name
  })
}

resource "azurerm_role_assignment" "workload_storage_blob_contributor" {
  for_each = { for each in var.workloads : each.name => each if each.github.template_repository == "poc-terraform-template"}

  scope                = azurerm_storage_account.workload[each.value.name].id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azuread_service_principal.workload[each.value.name].object_id
}