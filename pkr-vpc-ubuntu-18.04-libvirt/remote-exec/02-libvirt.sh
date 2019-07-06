#!/usr/bin/env bash

policy_rc_d_disable() (echo "exit 101" >/usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d)
policy_rc_d_enable()  (echo "exit 0"   >/usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d)

set -o errexit -o nounset -o pipefail
set -x

apt-get -q update -y

policy_rc_d_disable

apt-get -q install -y \
    qemu-kvm \
    libvirt-bin=${LIBVIRT_VERSION_APT}

cat >>/etc/libvirt/qemu.conf <<EOF
user = "root"
group = "root"
security_driver = "none"
EOF

systemctl start libvirtd

virsh pool-define-as --name="default" --type="dir" --target="/var/lib/libvirt/images/"
virsh pool-autostart "default"

systemctl stop libvirtd

policy_rc_d_enable

apt-get -q clean

sync

# vim:ts=4:sw=4:et:syn=sh:
