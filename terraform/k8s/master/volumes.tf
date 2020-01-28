
resource "libvirt_volume" "master_base" {
    count = var._count > 0 ? 1 : 0

    name   = "${var.k8s_id}m${3*count.index + var.availability_zone["index"] + 1}-base"
    source = var.image
}

resource "libvirt_volume" "master" {
    count = var._count

    name           = "${var.k8s_id}m${3*count.index + var.availability_zone["index"] + 1}"
    size           = var.storage
    base_volume_id = libvirt_volume.master_base.*.id[0]
}

# vim:ts=4:sw=4:et:
