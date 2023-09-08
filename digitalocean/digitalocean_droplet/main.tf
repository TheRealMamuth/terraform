resource "digitalocean_droplet" "student_hosts" {
    count = var.student_count
    image = var.droplet_image
    name = "${var.droplet_name}-${count.index}"
    region = var.droplet_region
    size = var.droplet_size
    vpc_uuid = var.droplet_vpc_uuid
}