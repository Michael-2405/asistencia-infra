variable "github_token" {
  description = "GitHub Personal Access Token con permisos de administración de repos"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "Tu usuario de GitHub"
  type        = string
}
