output "droplet_ip_addresses" {
  value = {
    for droplet in digitalocean_droplet.student_hosts :
    droplet.name => droplet.ipv4_address
  }
  description = "value of the droplet ip addresses"
}

output "droplet_urns" {
  value       = [for droplet in digitalocean_droplet.student_hosts : droplet.urn]
  description = "URNs of the droplets"
}

output "droplet_map" {
  value = [
    for droplet in digitalocean_droplet.student_hosts : {
      name = droplet.name
      id = droplet.id
      ip = droplet.ipv4_address
      ip_priv = droplet.ipv4_address_private
    }
  ]
}
