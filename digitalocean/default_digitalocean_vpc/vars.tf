variable "my_secound_octet" {
  description = "In this value you define secound octet - 10.X.0.0/20"
  default     = "255"
  type        = string
}

variable "my_team_account_name" {
  description = "Your team account name in digitalocean"
  default     = "Default"
  type        = string
}

variable "my_digitalocean_vpc_name" {
  description = "This is name for you networks"
  default     = "default"
  type        = string
}