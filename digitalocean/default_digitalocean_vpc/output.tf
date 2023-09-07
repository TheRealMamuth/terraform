output "digitalocean_vpc_ids" {
  value = {
    for region, vpc in digitalocean_vpc.my_digitalocean_vpc : region => vpc.id
  }
  description = "Map of DigitalOcean VPC IDs by region"
}