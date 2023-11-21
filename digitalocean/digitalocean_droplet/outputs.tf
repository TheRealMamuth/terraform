output "droplet_ip_addresses" {
  value = {
    for droplet in digitalocean_droplet.droplet_hosts :
    droplet.name => droplet.ipv4_address
  }
  description = "value of the droplet ip addresses"
}

output "droplet_ip_addresses_users" {
  value = {
    for droplet in digitalocean_droplet.droplet_hosts_by_users :
    droplet.name => droplet.ipv4_address
  }
  description = "value of the droplet ip addresses"
}

output "droplet_urns" {
  value       = [for droplet in digitalocean_droplet.droplet_hosts : droplet.urn]
  description = "URNs of the droplets"
}

output "droplet_map" {
  value = [
    for droplet in digitalocean_droplet.droplet_hosts : {
      name = droplet.name
      id = droplet.id
      ip = droplet.ipv4_address
      ip_priv = droplet.ipv4_address_private
    }
  ]
}

output "droplet_map_users" {
  value = [
    for droplet in digitalocean_droplet.droplet_hosts_by_users : {
      name = droplet.name
      id = droplet.id
      ip = droplet.ipv4_address
      ip_priv = droplet.ipv4_address_private
    }
  ]
}
