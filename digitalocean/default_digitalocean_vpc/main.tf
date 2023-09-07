resource "digitalocean_vpc" "vpc" {
  for_each = local.regions

  name        = "tf-${var.vpc_name}-${each.key}-vpc"
  region      = each.key
  ip_range    = "10.${var.secound_octet}.${each.value}.0/20"
  description = "Default VPC in ${each.key} in ${var.team_account_name} account"
}

data "digitalocean_vpc" "vpc" {
  for_each = local.regions

  name = "tf-${var.vpc_name}-${each.key}-vpc"
  depends_on = [
    digitalocean_vpc.vpc
  ]
}