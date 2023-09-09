output "domain_urn" {
  value = data.digitalocean_domain.domain.urn
}

output "domain_zone" {
  value = data.digitalocean_domain.domain.zone_file
}

output "domain_id" {
  value = digitalocean_domain.domain.id
}