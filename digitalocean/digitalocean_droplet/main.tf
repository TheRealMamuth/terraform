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
  tags = ["szkolenie"]
}

resource "digitalocean_droplet" "droplet_hosts_by_users" {
  for_each =  { for u in local.users : u.id => u}

  image    = var.droplet_config["image"]
  name     = "${var.droplet_config["name"]}-${each.value.id}-${replace(each.value.name, " ", "-")}"
  region   = var.droplet_config["region"]
  size     = var.droplet_config["size"]
  vpc_uuid = var.droplet_config["vpc_uuid"]
  user_data = file(var.droplet_config["user_data"])
  ssh_keys = [digitalocean_ssh_key.student_ssh_key.id]
  tags = ["szkolenie"]

  provisioner "file" {
    source = "${path.cwd}/_files/ro-bb-student"
    destination = "/tmp/ro-bb-student"

    connection {
      type = "ssh"
      user = "root"
      private_key = tls_private_key.ssh_key.private_key_pem
      host = self.ipv4_address
    }
  }
}

resource "tls_private_key" "ssh_key" {
    algorithm = "ED25519"
}

resource "digitalocean_ssh_key" "student_ssh_key" {
  name = "ro-bb-student"
  public_key = tls_private_key.ssh_key.public_key_openssh
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
  resources = [for d in values(digitalocean_droplet.droplet_hosts_by_users) : d.urn]
}