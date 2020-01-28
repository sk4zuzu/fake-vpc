#!/usr/bin/env bash

policy_rc_d_disable() (echo "exit 101" >/usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d)
policy_rc_d_enable()  (echo "exit 0"   >/usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d)

set -o errexit -o nounset -o pipefail
set -x

apt-get -q update -y

policy_rc_d_disable

apt-get -q install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

apt-get -q install -y --no-install-recommends \
    pv \
    vim mc htop \
    net-tools iproute2 netcat nmap \
    iftop nethogs \
    jq

policy_rc_d_enable

apt-get -q clean

install -d -o root -g ubuntu -m ug=rwx,o= /terraform{,/remote-exec}

sync

# vim:ts=4:sw=4:et:syn=sh: