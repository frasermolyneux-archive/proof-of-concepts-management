environment = "poc"
location    = "uksouth"

tags = {
  Environment = "poc",
  Workload    = "proof-of-concepts-management",
  DeployedBy  = "GitHub-Terraform",
  Git         = "https://github.com/frasermolyneux/proof-of-concepts-management"
}

workloads = [
  {
    name = "poc-bpr4zbka3iv50t2"
    github = {
      description         = "This repository contains a proof of concept for using environments and Virtual Machine targets for IIS deployments with YAML pipelines in Azure DevOps."
      topics              = ["azure-pipelines", "virtual-machines", "yaml", "iis", "environments", "devops"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name = "poc-waf-policy-bicep"
    github = {
      description         = "This repository contains a proof of concept for for managing an Azure WAF policy using Bicep."
      topics              = ["azure", "web-application-firewall", "policy", "managed-rule-sets", "bicep", "github-actions"]
      visibility          = "public"
      template_repository = "poc-bicep-template"
    }
  },
  {
    name = "poc-multiregion-app-terraform"
    github = {
      description         = "This repository contains a proof of concept for a multi-region deployment of an .NET 7 Web Application using Azure Front Door, Azure Web Application Firewall and Azure App Services."
      topics              = ["azure", "terraform", "github-actions", "multi-region", "frontdoor", "waf", "dotnet-7", "app-services"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name = "poc-secure-func-terraform"
    github = {
      description         = "This repository contains a proof of concept for deploying a function app with virtual network integration and private endpoints."
      topics              = ["azure", "terraform", "github-actions", "function-app", "vnet-integration", "private-endpoints"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name                  = "poc-la-standard-terraform"
    create_ado_connection = true
    github = {
      description         = "This repository contains a proof of concept for deploying a logic app with virtual network integration and private endpoints."
      topics              = ["azure", "terraform", "azure-pipelines", "logic-app", "vnet-integration", "private-endpoints"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name                  = "poc-mkdocs-ado-bicep"
    create_ado_connection = true
    github = {
      description         = "This repository contains a proof of concept for building and deploying a markdown docs site into an app service with authentication using Azure DevOps and Bicep."
      topics              = ["azure", "bicep", "azure-pipelines", "app-services", "authentication", "devops", "markdown", "mkdocs"]
      visibility          = "public"
      template_repository = "poc-bicep-template"
    }
  },
  {
    name = "poc-moving-apps-between-plans"
    github = {
      description         = "This repository generates resources for moving apps between plans in Azure App Services."
      topics              = ["azure", "terraform", "github-actions", "app-services", "logic-app", "function-app", "app-service-plan", "private-endpoints"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name                  = "poc-key-vault-demo"
    create_ado_connection = true
    github = {
      description         = "This repository generates resources for a demo of Azure Key Vauult and integration with integration resources and Azure DevOps pipelines"
      topics              = ["azure", "terraform", "github-actions", "azure-pipelines", "keyvault"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  }
]
