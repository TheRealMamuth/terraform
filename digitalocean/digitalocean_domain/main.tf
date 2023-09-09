resource "digitalocean_domain" "domain" {
  name = var.domain_config["name"]
}

data "digitalocean_domain" "domain" {
  name       = var.domain_config["name"]
  depends_on = [digitalocean_domain.domain]
}

data "digitalocean_project" "playground" {
  name = var.project_name
}

resource "digitalocean_project_resources" "barfoo" {
  project   = data.digitalocean_project.playground.id
  resources = [ digitalocean_domain.domain.urn ]
}

resource "digitalocean_record" "dns_entry" {
  for_each = { for entry in var.dns_entries : entry.name => entry }

  domain = digitalocean_domain.domain.name
  type   = each.value.type
  name   = each.value.name
  value  = each.value.target
  ttl    = each.value.ttl
}