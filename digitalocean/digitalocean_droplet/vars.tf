variable "droplet_name" {
    description = "This is name for your droplet"
    default     = "default"
    type        = string
}

variable "droplet_image" {
    description = "This is image for your droplet"
    default     = "ubuntu-20-04-x64"
    type        = string
}

varable "droplet_region" {
    description = "This is region for your droplet"
    default     = "fra1"
    type        = string
}

variable "droplet_size" {
    description = "This is size for your droplet"
    default     = "s-1vcpu-1gb"
    type        = string
}
  
variable "droplet_agent" {
    description = "This is agent for your droplet"
    default     = "true"
    type        = string
}

variable "droplet_vpc_uuid" {
    description = "This is vpc uuid for your droplet"
    default     = ""
    type        = string
}

variable "student_count" {
    description = "This is count for your droplet"
    default     = 1
    type        = number
}