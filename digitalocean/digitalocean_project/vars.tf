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

variable "urns" {
  description = "List of urns"
  default     = []
}
