
resource "libvirt_volume" "utl_base" {
    count = length(var.utl_hosts) > 0 ? 1 : 0

    name   = "${var.vpc_id}_utl_base"
    source = var.base_image
    pool   = var.storage_pool
}

resource "libvirt_volume" "utl" {
    count = length(var.utl_hosts) > 0 ? 1 : 0

    name           = lookup(var.utl_hosts[count.index], "name")
    base_volume_id = libvirt_volume.utl_base.*.id[0]
    pool           = var.storage_pool
}

# vim:ts=4:sw=4:et:
