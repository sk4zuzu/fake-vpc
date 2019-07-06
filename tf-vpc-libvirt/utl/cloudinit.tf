
data "external" "network_config" {
    count = "${length(var.utl_hosts) > 0 ? 1 : 0}"

    program = [ "${path.module}/external/network_config.py" ]

    query = {
        vpc_id        = "${var.vpc_id}"
        networks_json = "${jsonencode(var.networks)}"
    }
}

resource "libvirt_cloudinit_disk" "utl" {
    count = "${length(var.utl_hosts) > 0 ? 1 : 0}"

    name = "${lookup(var.utl_hosts[count.index], "name")}.iso"

    meta_data = <<-EOF
    instance-id: "${lookup(var.utl_hosts[count.index], "name")}"
    local-hostname: "${lookup(var.utl_hosts[count.index], "name")}"
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
    write_files:
      - content: |
          net.ipv4.ip_forward = 1
        path: /etc/sysctl.d/98-ip-forward.conf
    runcmd:
      - ["sysctl", "-p", "/etc/sysctl.d/98-ip-forward.conf"]
    EOF
}

# vim:ts=4:sw=4:et:
