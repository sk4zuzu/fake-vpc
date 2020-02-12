
terraform {
    backend "local" {}
}

provider "libvirt" {
    alias = "az1"
    uri   = "qemu+ssh://root@${cidrhost(lookup(var.availability_zones[0], "subnet"), 10)}/system?no_verify=1"
}

provider "libvirt" {
    alias = "az2"
    uri   = "qemu+ssh://root@${cidrhost(lookup(var.availability_zones[1], "subnet"), 10)}/system?no_verify=1"
}

provider "libvirt" {
    alias = "az3"
    uri   = "qemu+ssh://root@${cidrhost(lookup(var.availability_zones[2], "subnet"), 10)}/system?no_verify=1"
}

# vim:ts=4:sw=4:et:
