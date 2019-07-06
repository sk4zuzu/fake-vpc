
data "external" "network_config" {
    count = "${length(var.vpc_hosts)}"

    program = [ "${path.module}/external/network_config.py" ]

    query = {
        index         = "${count.index}"
        vpc_id        = "${var.vpc_id}"
        networks_json = "${jsonencode(var.networks)}"
    }
}

resource "libvirt_cloudinit_disk" "vpc" {
    count = "${length(var.vpc_hosts)}"

    name = "${lookup(var.vpc_hosts[count.index], "name")}.iso"

    meta_data = <<-EOF
    instance-id: "${lookup(var.vpc_hosts[count.index], "name")}"
    local-hostname: "${lookup(var.vpc_hosts[count.index], "name")}"
    EOF

    network_config = "${lookup(data.external.network_config.*.result[count.index], "yaml")}"

    user_data = <<-EOF
    #cloud-config
    ssh_pwauth: false
    users:
      - name: ubuntu
        ssh_authorized_keys: ${jsonencode(var.ssh_keys)}
      - name: root
        ssh_authorized_keys: ${jsonencode(var.ssh_keys)}
    chpasswd:
      list:
        - ubuntu:#ubuntu@!?
      expire: false
    growpart:
      mode: auto
      devices: ["/"]
    fs_setup:
      - label: images
        filesystem: xfs
        device: "/dev/vdb"
        overwrite: false
    mounts:
      - ["/dev/vdb", "/var/lib/libvirt/images/", xfs, "defaults,noatime,nodiratime", 0, 0]
    write_files:
      - content: |
          net.ipv4.ip_forward = 1
        path: /etc/sysctl.d/98-ip-forward.conf
    runcmd:
      - ["sysctl", "-p", "/etc/sysctl.d/98-ip-forward.conf"]
    EOF
}

# vim:ts=4:sw=4:et:
