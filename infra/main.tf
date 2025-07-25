terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "1.7.0"
    }
  }
}

provider "render" {
  api_key = var.render_api_key
}

resource "render_web_service" "app" {
  name   = "advice-app"
  plan   = "free"
  region = "oregon"

  runtime_source = {
    docker = {
      dockerfile_path = "Dockerfile"
      docker_context  = "."
    }
  }

  env_vars = {
    PORT = "80"
  }
}
