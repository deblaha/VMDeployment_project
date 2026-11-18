variable "environment" {
  type = string
  default = "demo"
}

variable "location_name" {
  type = string
  default = "demo"
}

variable "virtutal_network_add_spaces" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
}

variable "snet_prefixes" {
  type = list(string)
  default = [ "10.0.1.0/16" ]
}

variable "virtual_machine_sku" {
  type = string  
  default = "demo"
}

variable "loginname" {
  type = string
  default = "demo"
}

variable "loginpwd" {
  type = string
  default = "demo"
  sensitive = true
}

variable "rsv_name" {
  type = string  
  default = "demo"
}

variable "bkp_name" {
  type = string
  default = "demo"
}

variable "sub_id" {
  type = string
  default = "demo"
}