resource "digitalocean_vpc" "vpc" {
  for_each = local.regions

  name        = "tf-${var.vpc_config["name"]}-${each.key}-vpc"
  region      = each.key
  ip_range    = "10.${var.vpc_config["secound_octet"]}.${each.value}.0/20"
  description = "Default VPC in ${each.key} in ${var.vpc_config["team_account_name"]} account"
}

data "digitalocean_vpc" "vpc" {
  for_each = local.regions

  name = "tf-${var.vpc_config["name"]}-${each.key}-vpc"
  depends_on = [
    digitalocean_vpc.vpc
  ]
}