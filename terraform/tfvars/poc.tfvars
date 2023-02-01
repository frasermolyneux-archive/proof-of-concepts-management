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
  }
]