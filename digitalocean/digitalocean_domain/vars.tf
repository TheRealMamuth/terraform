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

variable "dns_entries" {
  description = "Lista rekordów DNS do dodania."
  default = [ {
    type  = ""
    name  = ""
    target = ""
    ttl   = 0
  } ]
  type = list(object({
    type  = string
    name  = string
    target = string
    ttl   = number
  }))
}