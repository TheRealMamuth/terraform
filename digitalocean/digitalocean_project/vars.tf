variable "project_config" {
  type = map(any)
  default = {
    name        = "DefaultProject",
    description = "This is default description please change it",
    purpose     = "This is default purpose please chcnge it",
    environment = "Development"
  }
  
}
