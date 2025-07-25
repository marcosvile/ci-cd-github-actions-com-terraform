output "service_url" {
  description = "URL do serviço implantado no Render"
  value       = render_web_service.app.service_url
}

output "service_id" {
  description = "ID do serviço no Render"
  value       = render_web_service.app.id
}

output "service_name" {
  description = "Nome do serviço no Render"
  value       = render_web_service.app.name
}
