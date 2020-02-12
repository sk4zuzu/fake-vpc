#!/usr/bin/env python3

import os
import json
import textwrap
import ipaddress

vpc_id = '${VPC_ID}'
networks_json = '${NETWORKS_JSON}'
dhcp_ignored_hosts_json = '${DHCP_IGNORED_HOSTS_JSON}'


def dnsmasq():
    networks, dhcp_ignored_hosts = (
        json.loads(networks_json)[1:],  # ignore "gw" network
        json.loads(dhcp_ignored_hosts_json)
    )

    subnets = [
        ipaddress.ip_network(network["subnet"])
        for network in networks
    ]

    interfaces = "\n".join(
        "interface=ens%d" % (index + 4)
        for index, _ in enumerate(subnets)
    )

    dhcp_ranges = "\n".join(
        "dhcp-range=ens%d,%s,%s,infinite" % (
            index + 4,
            str(subnet[11]),
            str(subnet[-2])
        )
        for index, subnet in enumerate(subnets)
    )

    dhcp_options = "\n".join([
        "dhcp-option=ens%d,option:dns-server,%s" % (
            index + 4,
            str(subnet[2])
        )
        for index, subnet in enumerate(subnets)
    ] + [
        "dhcp-option=ens%d,option:router,%s" % (
            index + 4,
            str(subnet[2])
        )
        for index, subnet in enumerate(subnets)
    ])

    dhcp_hosts = "\n".join(
        "dhcp-host=%s,ignore" % ignored_host
        for ignored_host in dhcp_ignored_hosts
    )

    with open("/var/lib/misc/dnsmasq.hosts", "w") as stream:
        stream.write("\n".join(
            "%s %s" % (
                subnets[index][10],
                network["name"]
            )
            for index, network in enumerate(networks)
        ))

    cfg = textwrap.dedent("""
    no-resolv
    server=8.8.8.8
    server=8.8.4.4
    no-hosts
    addn-hosts=/var/lib/misc/dnsmasq.hosts
    strict-order
    domain={vpc_id}.local
    expand-hosts
    except-interface=lo
    bind-interfaces
    {interfaces}
    dhcp-no-override
    dhcp-authoritative
    dhcp-lease-max=253
    {dhcp_ranges}
    {dhcp_options}
    {dhcp_hosts}
    """).format(
        vpc_id=vpc_id,
        interfaces=interfaces,
        dhcp_ranges=dhcp_ranges,
        dhcp_options=dhcp_options,
        dhcp_hosts=dhcp_hosts
    )

    with open("/etc/dnsmasq.d/%s" % vpc_id, "w") as stream:
        stream.write(cfg)

    if os.system("systemctl restart dnsmasq") != 0:
        raise RuntimeError()


if __name__ == "__main__":
    dnsmasq()


# vim:ts=4:sw=4:et:syn=python:
