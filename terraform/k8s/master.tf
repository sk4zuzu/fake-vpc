
module "master-az1" {
    source = "./master/"

    providers = {
        libvirt = libvirt.az1
    }

    k8s_id = var.k8s_id

    availability_zone = merge(
        var.availability_zones[0],
        map("index", 0)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.master["vcpu"]
    memory  = var.master["memory"]
    image   = var.master["image"]
    storage = var.master["storage"]

    _count = floor((2 + var.master["count"])/3)
}

module "master-az2" {
    source = "./master/"

    providers = {
        libvirt = libvirt.az2
    }

    k8s_id = var.k8s_id

    availability_zone = merge(
        var.availability_zones[1],
        map("index", 1)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.master["vcpu"]
    memory  = var.master["memory"]
    image   = var.master["image"]
    storage = var.master["storage"]

    _count = floor((1 + var.master["count"])/3)
}

module "master-az3" {
    source = "./master/"

    providers = {
        libvirt = libvirt.az3
    }

    k8s_id = var.k8s_id

    availability_zone = merge(
        var.availability_zones[2],
        map("index", 2)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.master["vcpu"]
    memory  = var.master["memory"]
    image   = var.master["image"]
    storage = var.master["storage"]

    _count = floor((0 + var.master["count"])/3)
}

# vim:ts=4:sw=4:et:
