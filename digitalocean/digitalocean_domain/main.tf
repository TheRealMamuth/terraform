resource "digitalocean_domain" "domain" {
  name = var.domain_config["name"]
}

data "digitalocean_domain" "domain" {
  name       = var.domain_config["name"]
  depends_on = [digitalocean_domain.domain]
}