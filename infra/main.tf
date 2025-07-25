terraform {
  required_providers {
    render = {
      source  = "render-oss/render"
      version = "1.7.0"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}

resource "render_web_service" "app" {
  name   = "advice-app"
  plan   = "starter"
  region = "oregon"

  runtime_source = {
    docker = {
      repo_url        = "https://github.com/marcosvile/ci-cd-h3"
      branch          = "main"
      dockerfile_path = "Dockerfile"
      docker_context  = "."
    }
  }

  env_vars = {
    PORT = {
      value = "80"
    }
  }
}
