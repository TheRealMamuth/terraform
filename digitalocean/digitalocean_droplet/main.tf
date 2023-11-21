locals {
  users = jsondecode(file("${path.cwd}/_files/${var.users_file}"))
}

resource "digitalocean_droplet" "droplet_hosts" {
  count    = var.droplet_count
  image    = var.droplet_config["image"]
  name     = "${var.droplet_config["name"]}-${count.index}"
  region   = var.droplet_config["region"]
  size     = var.droplet_config["size"]
  vpc_uuid = var.droplet_config["vpc_uuid"]
  user_data = file(var.droplet_config["user_data"])
}

resource "digitalocean_droplet" "droplet_hosts_by_users" {
  for_each =  { for u in local.users : u.id => u}

  image    = var.droplet_config["image"]
  name     = "${var.droplet_config["name"]}-${each.value.id}-${replace(each.value.name, " ", "-")}"
  region   = var.droplet_config["region"]
  size     = var.droplet_config["size"]
  vpc_uuid = var.droplet_config["vpc_uuid"]
  user_data = file(var.droplet_config["user_data"])
}


data "digitalocean_project" "playground" {
  name = var.project_name
}

resource "digitalocean_project_resources" "barfoo" {
  project   = data.digitalocean_project.playground.id
  resources = flatten(digitalocean_droplet.droplet_hosts.*.urn)
}

resource "digitalocean_project_resources" "add_user_droplet_to_project" {
  project   = data.digitalocean_project.playground.id
  resources = flatten(digitalocean_droplet.droplet_hosts_by_users.*.urn)
}