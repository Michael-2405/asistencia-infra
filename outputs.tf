output "asistencia_web_url" {
  description = "URL del repositorio asistencia-web"
  value       = github_repository.asistencia_web.html_url
}

output "asistencia_api_url" {
  description = "URL del repositorio asistencia-api"
  value       = github_repository.asistencia_api.html_url
}
