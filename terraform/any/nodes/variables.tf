
variable "any_id" {
    type = string
}

variable "availability_zone" {
    type = map
}

variable "ssh_keys" {
    type = list
}

variable "vcpu" {
    type = string
}

variable "memory" {
    type = string
}

variable "image" {
    type = string
}

variable "storage" {
    type = string
}

variable "_count" {
    type = number
}

# vim:ts=4:sw=4:et:
