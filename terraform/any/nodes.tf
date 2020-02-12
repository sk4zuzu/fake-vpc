
module "nodes-az1" {
    source = "./nodes/"

    providers = {
        libvirt = libvirt.az1
    }

    any_id = var.any_id

    availability_zone = merge(
        var.availability_zones[0],
        map("index", 0)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.nodes["vcpu"]
    memory  = var.nodes["memory"]
    image   = var.nodes["image"]
    storage = var.nodes["storage"]

    _count = floor((2 + var.nodes["count"])/3)
}

module "nodes-az2" {
    source = "./nodes/"

    providers = {
        libvirt = libvirt.az2
    }

    any_id = var.any_id

    availability_zone = merge(
        var.availability_zones[1],
        map("index", 1)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.nodes["vcpu"]
    memory  = var.nodes["memory"]
    image   = var.nodes["image"]
    storage = var.nodes["storage"]

    _count = floor((1 + var.nodes["count"])/3)
}

module "nodes-az3" {
    source = "./nodes/"

    providers = {
        libvirt = libvirt.az3
    }

    any_id = var.any_id

    availability_zone = merge(
        var.availability_zones[2],
        map("index", 2)
    )

    ssh_keys = var.ssh_keys

    vcpu    = var.nodes["vcpu"]
    memory  = var.nodes["memory"]
    image   = var.nodes["image"]
    storage = var.nodes["storage"]

    _count = floor((0 + var.nodes["count"])/3)
}

# vim:ts=4:sw=4:et:
