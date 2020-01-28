
resource "libvirt_volume" "vpc_base" {
    count = length(var.vpc_hosts) > 0 ? 1 : 0

    name   = "${var.vpc_id}_vpc_base"
    source = var.base_image
    pool   = var.storage_pool
}

resource "libvirt_volume" "vpc" {
    count = length(var.vpc_hosts)

    name           = lookup(var.vpc_hosts[count.index], "name")
    base_volume_id = libvirt_volume.vpc_base.*.id[0]
    pool           = var.storage_pool
}

resource "libvirt_volume" "vpc_data" {
    count = length(var.vpc_hosts)

    name = "${lookup(var.vpc_hosts[count.index], "name")}_data"
    size = lookup(var.vpc_hosts[count.index], "storage")
    pool = var.storage_pool
}

# vim:ts=4:sw=4:et:
