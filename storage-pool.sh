#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
set -x

virsh pool-define-as --name="default" --type="dir" --target="/default"
virsh pool-autostart "default"
virsh pool-start "default"
virsh pool-list

virsh pool-define-as --name="vg0" --type="logical" --source-format="lvm2" --target="/dev/vg0/"
virsh pool-autostart "vg0"
virsh pool-start "vg0"
virsh pool-list

# vim:ts=4:sw=4:et:syn=sh:
