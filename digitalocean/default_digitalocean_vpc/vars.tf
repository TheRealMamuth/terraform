variable "vpc_config" {
  type = map(any)
  default = {
    name        = "default",
    team_account_name = "default",
    secound_octet     = "255"
  }
  
}
