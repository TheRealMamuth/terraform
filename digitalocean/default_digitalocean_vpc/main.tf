resource "digitalocean_vpc" "my_digitalocean_vpc" {
  for_each = local.regions

  name        = "tf-${var.my_digitalocean_vpc_name}-${each.key}-vpc"
  region      = each.key
  ip_range    = "10.${var.my_secound_octet}.${each.value}.0/20"
  description = "Default VPC in ${each.key} in ${var.my_team_account_name} account"
}

data "digitalocean_vpc" "my_digitalocean_vpc" {
  for_each = local.regions

  name = "tf-${var.my_digitalocean_vpc_name}-${each.key}-vpc"
  depends_on = [
    digitalocean_vpc.my_digitalocean_vpc
  ]
}