// SAMPLE VARIABLES.TF FILE CONFIGURATIONS

variable "onefuse_scheme" {
  type = string
  default = "https"
}

variable "onefuse_address" {
  type = string
  default = "10.133.121.9"
}

variable "test_param2" {
  type = string
}

variable "onefuse_port" {
  type = string
  default = "443"
}

variable "onefuse_user" {
  type = string
  default = "admin"
}

variable "onefuse_password" {
  type = string
  default = "admin"
}

variable "onefuse_verify_ssl" {
  type = bool
  default = false
}

variable "workspace_url" {
  type = string
  default = ""              // Default
}

variable "template_properties" {
  type = map
  default = {
    "Environment" = "d"     //p for production or d for development
    "Location"    = "w"     //e for East or w for West
    "Application" = "wp"    //wp for wordpress or iis for IIS
    "OS"          = "l"     //l for Linux or w for Windows
  }
}
