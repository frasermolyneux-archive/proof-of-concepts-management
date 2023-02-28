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
  }
]
