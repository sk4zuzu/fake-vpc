
resource "libvirt_volume" "vpc-base" {
    count = "${length(var.vpc_hosts) > 0 ? 1 : 0}"

    name   = "${var.vpc_id}-base"
    source = "${var.base_image}"
}

resource "libvirt_volume" "vpc" {
    count = "${length(var.vpc_hosts)}"

    name           = "${lookup(var.vpc_hosts[count.index], "name")}"
    base_volume_id = "${libvirt_volume.vpc-base.*.id[0]}"
}

resource "libvirt_volume" "vpc-data" {
    count = "${length(var.vpc_hosts)}"

    name   = "${lookup(var.vpc_hosts[count.index], "name")}"
    size   = "${lookup(var.vpc_hosts[count.index], "storage")}"
    pool   = "${lookup(var.vpc_hosts[count.index], "pool")}"
    format = "raw"
}

# vim:ts=4:sw=4:et:
