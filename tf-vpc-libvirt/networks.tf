
resource "libvirt_network" "vpc-gw" {
    count = "${length(var.networks) >= 1 ? 1 : 0}"

    name      = "${lookup(var.networks[count.index], "name")}"
    domain    = "${var.vpc_id}.local"
    addresses = [ "${lookup(var.networks[count.index], "subnet")}" ]

    mode   = "nat"
    bridge = "${lookup(var.networks[count.index], "name")}"

    dhcp { enabled = true }
    dns  { enabled = false }

    autostart = true
}

resource "libvirt_network" "vpc" {
    count = "${length(var.networks) > 1 ? length(var.networks) - 1 : 0}"

    name      = "${lookup(var.networks[count.index + 1], "name")}"
    domain    = "${var.vpc_id}.local"
    addresses = [ "${lookup(var.networks[count.index + 1], "subnet")}" ]

    mode   = "route"
    bridge = "${lookup(var.networks[count.index + 1], "name")}"

    dhcp { enabled = false }
    dns  { enabled = false }

    autostart = true
}

# vim:ts=4:sw=4:et:
