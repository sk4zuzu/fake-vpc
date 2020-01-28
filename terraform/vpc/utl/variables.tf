
variable "python" {
    type = string
    default = ""
}

variable "vpc_id" {
    type = string
}

variable "ssh_keys" {
    type = list
}

variable "storage_pool" {
    type = string
}

variable "base_image" {
    type = string
}

variable "networks" {
    type = list
}

variable "utl_hosts" {
    type = list
}

# vim:ts=4:sw=4:et:
