
resource "libvirt_volume" "nodes_base" {
    count = var._count > 0 ? 1 : 0

    name   = "${var.any_id}n${3*count.index + var.availability_zone["index"] + 1}-base"
    source = var.image
}

resource "libvirt_volume" "nodes" {
    count = var._count

    name           = "${var.any_id}n${3*count.index + var.availability_zone["index"] + 1}"
    size           = var.storage
    base_volume_id = libvirt_volume.nodes_base.*.id[0]
}

# vim:ts=4:sw=4:et:
