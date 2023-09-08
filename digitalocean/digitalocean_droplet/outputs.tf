output "droplet_ip_addresses" {
  value = {
    for droplet in digitalocean_droplet.student_hosts:
    droplet.name => droplet.ipv4_address
  }
}