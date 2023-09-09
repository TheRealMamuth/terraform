resource "digitalocean_project" "project" {
  name        = var.project_config["name"]
  description = var.project_config["description"]
  purpose     = var.project_config["purpose"]
  environment = var.project_config["environment"]
}

data "digitalocean_project" "project" {
  name       = var.project_config["name"]
  depends_on = [digitalocean_project.project]
}