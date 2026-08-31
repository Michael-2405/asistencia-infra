locals {
  repos = {
    web = github_repository.asistencia_web.node_id
    api = github_repository.asistencia_api.node_id
  }
}

resource "github_branch_protection" "main" {
  for_each = local.repos

  repository_id = each.value
  pattern       = "main"

  required_status_checks {
    strict   = true
    contexts = ["ci"]
  }

  required_pull_request_reviews {
    required_approving_review_count = 0
  }

  enforce_admins = false
}

resource "github_branch_protection" "develop" {
  for_each = local.repos

  repository_id = each.value
  pattern       = "develop"

  required_status_checks {
    strict   = true
    contexts = ["ci"]
  }

  enforce_admins = false
}
