#!/usr/bin/env bash

: ${LIBVIRT_VERSION_APT:=4.0.0-1ubuntu8}

set -o errexit -o nounset -o pipefail
set -x

which readlink xargs dirname docker packer /bin/rm

SELF=`readlink -f $0 | xargs dirname`

VERSION="18.04"
IMAGE="ubuntu-${VERSION}-server-cloudimg-amd64.vmdk"
SHA256="b5f12e2132438a271cac82bb7402d497d12309cab3cc808571b2a754555a2de1"

DISK_SIZE="$((12*1024))"

CLOUD_CONFIG="
#cloud-config
password: ubuntu
ssh_pwauth: true
chpasswd:
  expire: false
"

function cleanup {
    if [ -f $SELF/$IMAGE.iso ]; then
        /bin/rm -f $SELF/$IMAGE.iso
    fi
}

trap cleanup EXIT

echo ">>> prepare temporary docker image <<<"

mkdir -p $SELF/.context/ && docker build -t $IMAGE $SELF/.context/ -f- <<EOF
FROM ubuntu:$VERSION

RUN apt-get -q update -y \
 && apt-get -q install -y --no-install-recommends cloud-utils

CMD /bin/bash
EOF

echo ">>> generate cloud-init iso image with config <<<"

docker run --rm -i $IMAGE /bin/bash -s >$SELF/$IMAGE.iso <<EOF
cloud-localds /dev/stdout <(echo "$CLOUD_CONFIG")
EOF

echo ">>> modify source disk image <<<"

packer build -force - <<EOF
{
  "builders": [
    {
      "type": "qemu",
      "headless": "true",
      "accelerator": "kvm",

      "disk_image": "true",
      "iso_url": "https://cloud-images.ubuntu.com/releases/${VERSION}/release/${IMAGE}",
      "iso_checksum": "$SHA256",
      "iso_checksum_type": "sha256",

      "disk_size": "$DISK_SIZE",

      "qemuargs": [
        ["-fda", "${SELF}/${IMAGE}.iso"]
      ],

      "ssh_username": "ubuntu",
      "ssh_password": "ubuntu",

      "output_directory": "$IMAGE",
      "vm_name": "qcow2"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "environment_vars": [
        "LIBVIRT_VERSION_APT=${LIBVIRT_VERSION_APT}"
      ],
      "execute_command": "sudo -iu root {{ .Vars }} {{ .Path }}",
      "scripts": [
        "remote-exec/01-basics.sh",
        "remote-exec/02-libvirt.sh"
      ]
    }
  ]
}
EOF

echo ">>> done <<<"

# vim:ts=4:sw=4:et:syn=sh:
