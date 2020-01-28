
resource "libvirt_domain" "utl" {
    count = length(var.utl_hosts) > 0 ? 1 : 0

    name   = lookup(var.utl_hosts[count.index], "name")
    vcpu   = lookup(var.utl_hosts[count.index], "vcpu")
    memory = lookup(var.utl_hosts[count.index], "memory")

    cloudinit = libvirt_cloudinit_disk.utl.*.id[count.index]

    dynamic "network_interface" {
        for_each = var.networks
        content {
            network_name = lookup(network_interface.value, "name")
            wait_for_lease = false
        }
    }

    console {
        type        = "pty"
        target_port = "0"
        target_type = "serial"
    }

    console {
        type        = "pty"
        target_type = "virtio"
        target_port = "1"
    }

    disk {
        volume_id = libvirt_volume.utl.*.id[count.index]
	}

    graphics {
        type           = "spice"
        listen_type    = "address"
        listen_address = "127.0.0.1"
        autoport       = true
    }

    autostart = true
}

# vim:ts=4:sw=4:et:
