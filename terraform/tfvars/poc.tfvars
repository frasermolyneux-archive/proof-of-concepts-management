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
    name = "poc-ais-demo"
    github = {
      description         = "This repository generates resources for a demo of Azure Integration Services"
      topics              = ["azure", "terraform", "github-actions", "azure-pipelines", "azure-integration-services"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
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
    name = "poc-la-standard-public-terraform"
    github = {
      description         = "This repository contains a proof of concept for deploying a logic app standard with public endpoints"
      topics              = ["azure", "terraform", "github-actions", "logic-app"]
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
  },
  {
    name = "poc-blazor-server"
    github = {
      description         = "https://learn.microsoft.com/en-gb/training/modules/build-blazor-webassembly-visual-studio-code/3-exercise-configure-enviromnent?pivots=vscode"
      topics              = ["ms-learn"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name = "poc-blazor-server-blazingpizza"
    github = {
      description         = "https://learn.microsoft.com/en-gb/training/modules/interact-with-data-blazor-web-apps/3-exercise-create-user-interfaces-with-blazor-components"
      topics              = ["ms-learn"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name = "poc-invision-on-azure"
    github = {
      description         = "This repository is a proof of concept for deploying Invision Community on Azure using Terraform."
      topics              = ["azure", "terraform", "invision"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name = "poc-appgateway-terraform"
    github = {
      description         = "This repository contains Terraform for deploying an application gateway"
      topics              = ["azure", "terraform", "github-actions", "application-gateway"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name = "poc-appserviceplan-upgrade"
    github = {
      description         = "This repository contains Terraform for deploying an app service plan and upgrading it with a destructive operation"
      topics              = ["azure", "terraform", "github-actions", "app-service-plan", "app-service"]
      visibility          = "public"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name = "poc-la-perf"
    github = {
      description         = "This repository contains some performance testing of Azure Logic Apps"
      topics              = ["azure", "terraform", "github-actions", "azure-pipelines", "service-bus", "logic-app", "performance-testing"]
      visibility          = "private"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name = "poc-la-identity"
    github = {
      description         = "This repository contains an example of using identities with logic appps"
      topics              = ["azure", "terraform", "github-actions", "logic-app"]
      visibility          = "private"
      template_repository = "poc-terraform-template"
    }
  },
  {
    name                  = "poc-terraform-connections"
    create_ado_connection = true
    github = {
      description         = "This repository contains some advanced approaches to permissions management of Terraform connections"
      topics              = ["azure", "terraform", "github-actions", "azure-pipelines"]
      visibility          = "private"
      template_repository = "poc-terraform-template"
    }
  }
]
