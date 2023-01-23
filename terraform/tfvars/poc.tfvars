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
      description = "mnk3m23diww5g4c"
      topics      = ["mnk3m23diww5g4c"]
      visibility  = "public"
    }
  }
]