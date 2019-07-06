
resource "libvirt_volume" "utl-base" {
    count = "${length(var.utl_hosts) > 0 ? 1 : 0}"

    name   = "${lookup(var.utl_hosts[count.index], "name")}-base"
    source = "${var.base_image}"
}

resource "libvirt_volume" "utl" {
    count = "${length(var.utl_hosts) > 0 ? 1 : 0}"

    name           = "${lookup(var.utl_hosts[count.index], "name")}"
    base_volume_id = "${libvirt_volume.utl-base.*.id[0]}"
}

# vim:ts=4:sw=4:et:
