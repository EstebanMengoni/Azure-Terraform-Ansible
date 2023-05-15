variable "vm_name" {
    description = "The name of the virtual machine"
    type = string
}

variable "environment" {
  description = "The name of the environment."
  type = string
}

variable "location" {
    description = "The location of the network"
    type = string
}

variable "rg_name" {
    description = "The name of the resource group"
    type = string
}

variable "network_interface_ids" {
    description = "The network interface ids"
    type = list(string)
}