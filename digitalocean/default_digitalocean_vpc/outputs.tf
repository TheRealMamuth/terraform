output "vpc_ids" {
  value = {
    for region, vpc in digitalocean_vpc.vpc : region => vpc.id
  }
  description = "Map of DigitalOcean VPC IDs by region"
}