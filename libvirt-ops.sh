#!/usr/bin/env bash

: ${DOCKER_CE_VERSION_APT:=18.06.0~ce~3-0~ubuntu}
: ${PACKER_VERSION:=1.4.2}
: ${TERRAFORM_VERSION:=0.12.3}
: ${TERRAFORM_PROVIDER_TEMPLATE_VERSION:=2.1.2}
: ${TERRAFORM_PROVIDER_NULL_VERSION:=2.1.2}
: ${TERRAFORM_PROVIDER_LOCAL_VERSION:=1.3.0}
: ${TERRAFORM_PROVIDER_TERRAFORM_VERSION:=1.0.2}
: ${TERRAFORM_PROVIDER_LIBVIRT_VERSION:=master}
: ${TERRAGRUNT_VERSION:=0.19.7}

if [ -z "$NO_CACHE" ] || [ "$NO_CACHE" = 0 ]; then
    NO_CACHE=""
else
    NO_CACHE="--no-cache"
fi

set -o errexit -o nounset -o pipefail
set -x

which readlink xargs dirname docker

SELF=`readlink -f $0 | xargs dirname`

mkdir -p $SELF/.context/ && docker build $NO_CACHE -t libvirt-ops $SELF/.context/ -f- <<EOF
FROM ubuntu:18.04

RUN apt-get -q update \\
 && apt-get -q install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common \\
 && apt-get -q install -y iproute2 openssl openssh-client git rsync vim \\
 && apt-get -q install -y jq python3 python3-pip \\
 && apt-get -q install -y gcc make pkg-config libffi-dev libssl-dev zlib1g-dev python-dev libvirt-dev \\
 && apt-get -q install -y libvirt-clients qemu-system-x86 genisoimage xsltproc \\
 && update-alternatives --install /usr/bin/mkisofs mkisofs /usr/bin/genisoimage 1 \\
 && apt-get -q clean

RUN pip3 --no-cache-dir install terraform_external_data ipaddress pyyaml

ENV GOPATH=/go
ENV PATH=\${GOPATH}/bin:\$PATH

RUN mkdir -p \${GOPATH}/bin/ \\
 && add-apt-repository -y ppa:gophers/archive \\
 && apt-get -q update \\
 && apt-get -q install -y golang-1.10-go \\
 && update-alternatives --install /usr/bin/go golang /usr/lib/go-1.10/bin/go 1 \\
 && apt-get -q clean

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \\
 && add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable" \\
 && apt-get -q update \\
 && apt-get -q install -y docker-ce=${DOCKER_CE_VERSION_APT} \\
 && apt-get -q clean

RUN set -x \\
 && hashicorp_release_install() { \\
        curl -fsSL https://releases.hashicorp.com/\$1/\$2/\$1_\$2_linux_amd64.zip \\
          | zcat >\${GOPATH}/bin/\$1 \\
         && chmod +x \${GOPATH}/bin/\$1; \\
    } \\
 && hashicorp_release_install packer ${PACKER_VERSION} \\
 && hashicorp_release_install terraform ${TERRAFORM_VERSION} \\
 && hashicorp_release_install terraform-provider-template ${TERRAFORM_PROVIDER_TEMPLATE_VERSION} \\
 && hashicorp_release_install terraform-provider-null ${TERRAFORM_PROVIDER_NULL_VERSION} \\
 && hashicorp_release_install terraform-provider-local ${TERRAFORM_PROVIDER_LOCAL_VERSION} \\
 && hashicorp_release_install terraform-provider-terraform ${TERRAFORM_PROVIDER_TERRAFORM_VERSION}

RUN PKGDIR=\${GOPATH}/src/github.com/dmacvicar/terraform-provider-libvirt \\
 && mkdir -p \${PKGDIR}/ && cd \${PKGDIR}/ \\
 && git clone --depth=1 -b ${TERRAFORM_PROVIDER_LIBVIRT_VERSION} https://github.com/dmacvicar/terraform-provider-libvirt.git . \\
 && go build -o \${GOPATH}/bin/terraform-provider-libvirt

RUN curl -fsSL https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 \\
         -o \${GOPATH}/bin/terragrunt \\
 && chmod +x \${GOPATH}/bin/terragrunt

RUN mkdir -p /root/.ssh/ \
 && echo "stricthostkeychecking no"  >/root/.ssh/config \
 && echo "forwardagent yes"         >>/root/.ssh/config

WORKDIR /self/LIVE/

ENTRYPOINT []
CMD /bin/bash
EOF

if [ -t 0 ]; then
    USE_TTY="-t"
else
    USE_TTY=""
fi

exec docker run --rm \
    --network="host" \
    --privileged="true" \
    --device="/dev/mapper/" \
    -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
    -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK:z \
    -v /var/run/libvirt/libvirt-sock:/var/run/libvirt/libvirt-sock:z \
    -v /var/run/docker.sock:/var/run/docker.sock:z \
    -v $SELF:/self/:Z \
    -i $USE_TTY libvirt-ops \
    "$@"

# vim:ts=4:sw=4:et:syn=sh:
