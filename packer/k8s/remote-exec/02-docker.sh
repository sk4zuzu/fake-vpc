#!/usr/bin/env bash

: ${DOCKER_CE_VERSION:=18.06.0}
: ${DOCKER_CE_VERSION_APT:=${DOCKER_CE_VERSION}~ce~3-0~ubuntu}

policy_rc_d_disable() (echo "exit 101" >/usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d)
policy_rc_d_enable()  (echo "exit 0"   >/usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d)

export DEBIAN_FRONTEND=noninteractive

set -o errexit -o nounset -o pipefail
set -x

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get -q update -y

policy_rc_d_disable

apt-get -q install -y \
    docker-ce="${DOCKER_CE_VERSION_APT}"

policy_rc_d_enable

apt-get -q clean

systemctl start docker

sync

# vim:ts=4:sw=4:et:syn=sh:
