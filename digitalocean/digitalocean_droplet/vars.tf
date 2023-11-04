variable "droplet_config" {
  type = map(any)
  default = {
    name     = "default",
    image    = "ubuntu-20-04-x64",
    region   = "fra1",
    size     = "s-1vcpu-1gb",
    agent    = "true",
    vpc_uuid = ""
  }
}

variable "droplet_count" {
  description = "This is count for your droplet"
  default     = 1
  type        = number
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "default"
}

variable "user_data_path" {
  description = "User data for droplet - path"
  type        = string
  default     = "./_files/init-script.yaml"
}