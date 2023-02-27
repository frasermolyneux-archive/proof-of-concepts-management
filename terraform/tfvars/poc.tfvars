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
    name = "poc-mnk3m23diww5g4c"
    github = {
      description = "This repository contains a proof of concept for a multi-region deployment of an .NET 7 Web Application using Azure Front Door, Azure Web Application Firewall and Azure App Services."
      topics      = ["azure", "terraform", "github-actions", "multi-region", "frontdoor", "waf", "dotnet-7", "app-services"]
      visibility  = "public"
    }
  },
  {
    name = "poc-xcr30k8hd6uj6iw"
    github = {
      description = "This repository contains a proof of concept aimed at exploring the use of GitHub Actions and GHAS"
      topics      = ["azure", "github-actions", "ci-cd", "ghas", "security", "codeql"]
      visibility  = "public"
    }
  },
  {
    name = "poc-kginjqpwprpqr5c"
    github = {
      description = "This repository contains a proof of concept for deploying a function app using vnet integration and private endpoints."
      topics      = ["azure", "terraform", "github-actions", "function-app", "vnet-integration", "private-endpoints"]
      visibility  = "public"
    }
  },
  {
    name = "poc-dve1ic4a9o9rmps"
    github = {
      description = "This repository contains a proof of concept for the common azure integration services such as APIM, Functions, Service Bus, Logic Apps etc."
      topics      = ["azure", "terraform", "azure-integration-services", "github-actions", "apim", "functions", "service-bus", "logic-apps"]
      visibility  = "public"
    }
  },
  {
    name = "poc-bpr4zbka3iv50t2"
    github = {
      description = "This repository contains a proof of concept for using environments and Virtual Machine targets for IIS deployments with YAML pipelines in Azure DevOps."
      topics      = ["azure-pipelines", "virtual-machines", "yaml", "iis", "environments", "devops"]
      visibility  = "public"
    }
  }
]
