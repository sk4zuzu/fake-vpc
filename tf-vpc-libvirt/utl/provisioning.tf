
resource "null_resource" "utl" {
    depends_on = [ "libvirt_domain.utl" ]

    count = "${length(var.utl_hosts) > 0 ? 1 : 0}"

    triggers = {
        always = "${uuid()}"
    }

    connection {
        type  = "ssh"
        user  = "ubuntu"
        host  = "${cidrhost(lookup(var.networks[0], "subnet"), 10)}"
        agent = true
    }

    provisioner "file" {
        source      = "${template_dir.remote-exec.*.destination_dir[0]}"
        destination = "/terraform/remote-exec"
    }

    provisioner "remote-exec" {
        inline = [
            "set -o errexit",
            "find /terraform/remote-exec -type f -name '*.py' | xargs chmod +x",
            "sudo -iu root /terraform/remote-exec/01-iptables.py",
            "sudo -iu root /terraform/remote-exec/02-dnsmasq.py",
        ]
    }
}

# vim:ts=4:sw=4:et:
