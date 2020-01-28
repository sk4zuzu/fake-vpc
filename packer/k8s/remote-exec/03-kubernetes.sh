#!/usr/bin/env bash

: ${KUBERNETES_VERSION:=1.12.8}
: ${KUBERNETES_VERSION_APT:=${KUBERNETES_VERSION}-00}
: ${KUBERNETES_CNI_VERSION:=0.7.5}
: ${KUBERNETES_CNI_VERSION_APT:=${KUBERNETES_CNI_VERSION}-00}

policy_rc_d_disable() (echo "exit 101" >/usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d)
policy_rc_d_enable()  (echo "exit 0"   >/usr/sbin/policy-rc.d && chmod a+x /usr/sbin/policy-rc.d)

export DEBIAN_FRONTEND=noninteractive

set -o errexit -o nounset -o pipefail
set -x

curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

add-apt-repository \
    "deb [arch=amd64] https://apt.kubernetes.io/ kubernetes-xenial main"

apt-get -q update -y

policy_rc_d_disable

apt-get -q install -y \
    kube{let,adm,ctl}="${KUBERNETES_VERSION_APT}" \
    kubernetes-cni="${KUBERNETES_CNI_VERSION_APT}"

apt-mark hold \
    kube{let,adm,ctl} \
    kubernetes-cni

kubeadm config images pull \
    --kubernetes-version="v${KUBERNETES_VERSION}"

policy_rc_d_enable

apt-get -q clean

sync

# vim:ts=4:sw=4:et:syn=sh:
