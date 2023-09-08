resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = var.project_environment
}

data "digitalocean_project" "project" {
  name = var.project_name
  depends_on = [ digitalocean_project.project ]
}

resource "digitalocean_project_resources" "project_resources" {
  project = data.digitalocean_project.project.id
  depends_on = [ digitalocean_project.project ]
  resources = [
    var.resources_urns
  ]
}