variable "location" {
  default = "uksouth"
}

variable "environment" {
  default = "dev"
}

variable "tags" {
  default = {}
}

variable "workloads" {
  type = list(object({
    name = string

    github = object({
      description = string
      topics      = optional(list(string), [])

      visibility = optional(string, "private")

      template_repository = optional(string, "poc-terraform-template")

      has_downloads = optional(bool, true)
      has_issues    = optional(bool, true)
      has_projects  = optional(bool, true)
      has_wiki      = optional(bool, true)
    })
  }))
}
