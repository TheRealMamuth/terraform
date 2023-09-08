variable "project_name" {
  description = "value"
  default     = "DefaultProject"
}

variable "project_description" {
  description = "value"
  default     = "This is default description please change it"
}

variable "project_purpose" {
  description = "value"
  default     = "This is default purpose please chcnge it"
}

variable "project_environment" {
  description = "Only accept Development, Staging, Production"
  default     = "Development"
}

variable "resources_urns" {
  description = "string of urns"
  default     = ""
  type = string
}
