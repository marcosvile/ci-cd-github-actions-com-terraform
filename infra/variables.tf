variable "render_api_key" {
  description = "Chave de API do Render"
  type        = string
  sensitive   = true
}

variable "render_owner_id" {
  description = "ID do proprietário (username) no Render"
  type        = string
  sensitive = true
}
