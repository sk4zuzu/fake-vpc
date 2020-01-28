
variable "k8s_id" {
    type = string
}

variable "availability_zones" {
    type = list
}

variable "ssh_keys" {
    type = list
}

variable "master" {
    type = map
}

variable "compute" {
    type = map
}

# vim:ts=4:sw=4:et:
