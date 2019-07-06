
variable "vpc_id" {
    type = "string"
}

variable "ssh_keys" {
    type = "list"
}

variable "base_images" {
    type = "map"
}

variable "networks" {
    type = "list"
}

variable "utl_hosts" {
    type = "list"
}

variable "vpc_hosts" {
    type = "list"
}

# vim:ts=4:sw=4:et:
