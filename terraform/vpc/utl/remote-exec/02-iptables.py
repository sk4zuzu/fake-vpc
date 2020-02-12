#!/usr/bin/env python3

import os
import json
import textwrap
import ipaddress, iptc

networks_json = '${NETWORKS_JSON}'


def iptables():
    networks = json.loads(networks_json)

    subnets = [
        ipaddress.ip_network(network["subnet"])
        for network in networks[1:]  # ignore "gw" network
    ]

    table = iptc.Table("nat")
    chain = iptc.Chain(table, "POSTROUTING")
    chain.flush()

    for subnet in subnets:
        rule = iptc.Rule()
        rule.src = str(subnet)
        rule.out_interface = "ens3"
        rule.target = iptc.Target(rule, "MASQUERADE")
        chain.insert_rule(rule)


if __name__ == "__main__":
    iptables()


# vim:ts=4:sw=4:et:syn=python:
