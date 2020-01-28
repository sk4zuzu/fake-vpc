
resource "libvirt_domain" "compute" {
    count = var._count

    name = "${var.k8s_id}c${3*count.index + var.availability_zone["index"] + 1}"

    vcpu   = var.vcpu
    memory = var.memory

    cloudinit = libvirt_cloudinit_disk.compute.*.id[count.index]

    network_interface {
        bridge         = var.availability_zone["name"]
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
        volume_id = libvirt_volume.compute.*.id[count.index]
	}
}

# vim:ts=4:sw=4:et:
