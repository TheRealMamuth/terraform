variable "domain_config" {
  type = map(any)
  default = {
    name = "example.com"
  }
}

variable "project_name" {
  type = string
  default = "default"
}
