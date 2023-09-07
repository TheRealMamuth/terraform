resource "digitalocean_project" "my_digitalocean_project" {
  name        = var.my_digitalocean_project_name
  description = var.my_digitalocean_project_description
  purpose     = var.my_digitalocean_project_purpose
  environment = var.my_digitalocean_project_environment
}

data "digitalocean_project" "playground" {
  name = var.my_digitalocean_project_name
}