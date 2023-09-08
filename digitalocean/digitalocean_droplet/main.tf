resource "digitalocean_droplet" "student_hosts" {
    count = var.student_count
    image = var.droplet_config["image"]
    name = "${var.droplet_config["name"]}-${count.index}"
    region = var.droplet_config["region"]
    size = var.droplet_config["size"]
    vpc_uuid = var.droplet_config["vpc_uuid"]
}

data "digitalocean_project" "playground" {
  name = var.project_name
}

resource "digitalocean_project_resources" "barfoo" {
  project = data.digitalocean_project.playground.id
  resources = flatten(digitalocean_droplet.student_hosts.*.urn)
}