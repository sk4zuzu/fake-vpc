
resource "libvirt_cloudinit_disk" "nodes" {
    count = var._count

    name = "${var.any_id}n${3*count.index + var.availability_zone["index"] + 1}.iso"

    meta_data = <<-EOF
    instance-id: "${var.any_id}n${3*count.index + var.availability_zone["index"] + 1}"
    local-hostname: "${var.any_id}n${3*count.index + var.availability_zone["index"] + 1}"
    EOF

    network_config = <<-EOF
    version: 2
    ethernets:
      ens3:
        dhcp4: true
        dhcp6: false
        dhcp-identifier: mac
    EOF

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
