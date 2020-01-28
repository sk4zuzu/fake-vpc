
resource "libvirt_domain" "vpc" {
    count = length(var.vpc_hosts)

    name   = lookup(var.vpc_hosts[count.index], "name")
    vcpu   = lookup(var.vpc_hosts[count.index], "vcpu")
    memory = lookup(var.vpc_hosts[count.index], "memory")

    cloudinit = libvirt_cloudinit_disk.vpc.*.id[count.index]

    cpu = {
        mode = "host-passthrough"
    }

    network_interface {
        network_name   = lookup(var.networks[count.index + 1], "name")
        wait_for_lease = false
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
        volume_id = libvirt_volume.vpc.*.id[count.index]
	}

    disk {
        volume_id = libvirt_volume.vpc_data.*.id[count.index]
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
