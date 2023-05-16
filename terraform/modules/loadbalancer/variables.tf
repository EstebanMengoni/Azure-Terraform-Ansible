variable "rg_name" {
  description = "The name of the resource group."
  type = string
}

variable "location" {
    description = "The location of the network"
    type = string
}

variable "public_ip_address" {
    description = "The public ip address"
    type = string
}