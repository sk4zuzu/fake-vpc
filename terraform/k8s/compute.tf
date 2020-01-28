
module "compute-az1" {
    source = "./compute/"

    providers = {
        libvirt = libvirt.az1
    }

    k8s_id = var.k8s_id

    availability_zone = merge(
        var.availability_zones[0],
        map("index", 0)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.compute["vcpu"]
    memory  = var.compute["memory"]
    image   = var.compute["image"]
    storage = var.compute["storage"]

    _count = floor((2 + var.compute["count"])/3)
}

module "compute-az2" {
    source = "./compute/"

    providers = {
        libvirt = libvirt.az2
    }

    k8s_id = var.k8s_id

    availability_zone = merge(
        var.availability_zones[1],
        map("index", 1)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.compute["vcpu"]
    memory  = var.compute["memory"]
    image   = var.compute["image"]
    storage = var.compute["storage"]

    _count = floor((1 + var.compute["count"])/3)
}

module "compute-az3" {
    source = "./compute/"

    providers = {
        libvirt = libvirt.az3
    }

    k8s_id = var.k8s_id

    availability_zone = merge(
        var.availability_zones[2],
        map("index", 2)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.compute["vcpu"]
    memory  = var.compute["memory"]
    image   = var.compute["image"]
    storage = var.compute["storage"]

    _count = floor((0 + var.compute["count"])/3)
}

# vim:ts=4:sw=4:et:
