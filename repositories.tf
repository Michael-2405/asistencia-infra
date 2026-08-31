resource "github_repository" "asistencia_web" {
  name        = "asistencia-web"
  description = "Attendance tracking frontend for MINERD schools"
  visibility  = "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_repository" "asistencia_api" {
  name        = "asistencia-api"
  description = "Attendance tracking backend API for MINERD schools"
  visibility  = "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  lifecycle {
    prevent_destroy = true
  }
}
