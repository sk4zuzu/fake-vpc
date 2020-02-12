
data "external" "hostname" {
    count = length(var.utl_hosts) > 0 ? 1 : 0

    program = [ "${path.module}/external/hostname.py" ]
}

resource "null_resource" "utl" {
    depends_on = [ libvirt_domain.utl ]

    count = length(var.utl_hosts) > 0 ? 1 : 0

    triggers = {
        always = uuid()
    }

    connection {
        type  = "ssh"
        user  = "ubuntu"
        host  = cidrhost(lookup(var.networks[0], "subnet"), 10)
        agent = true
    }

    provisioner "file" {
        content = templatefile("${path.module}/remote-exec/01-openssh.py", {
        })
        destination = "/terraform/remote-exec/01-openssh.py"
    }

    provisioner "file" {
        content = templatefile("${path.module}/remote-exec/02-iptables.py", {
            NETWORKS_JSON = jsonencode(var.networks)
        })
        destination = "/terraform/remote-exec/02-iptables.py"
    }

    provisioner "file" {
        content = templatefile("${path.module}/remote-exec/03-dnsmasq.py", {
            VPC_ID                  = var.vpc_id
            NETWORKS_JSON           = jsonencode(var.networks)
            DHCP_IGNORED_HOSTS_JSON = jsonencode(list(lookup(data.external.hostname.*.result[count.index], "hostname")))
        })
        destination = "/terraform/remote-exec/03-dnsmasq.py"
    }

    provisioner "remote-exec" {
        inline = [
            "set -o errexit",
            "find /terraform/remote-exec -type f -name '*.py' | xargs chmod +x",
            "sudo -iu root /terraform/remote-exec/01-openssh.py",
            "sudo -iu root /terraform/remote-exec/02-iptables.py",
            "sudo -iu root /terraform/remote-exec/03-dnsmasq.py",
        ]
    }
}

# vim:ts=4:sw=4:et:
