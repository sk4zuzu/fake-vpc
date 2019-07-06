#!/usr/bin/env python3

from terraform_external_data import terraform_external_data

import json
import yaml
import ipaddress


@terraform_external_data
def network_config(query):
    vpc_id, networks = (
        query["vpc_id"],
        json.loads(query["networks_json"])
    )

    subnets = [
        ipaddress.ip_network(network["subnet"])
        for network in networks
    ]

    ethernets = {
        "ens3": {
            "dhcp4": False,
            "dhcp6": False,
            "addresses": ["%s/%d" % (str(subnets[0][10]), subnets[0].prefixlen)],
            "routes": [
                {
                    "to": "0.0.0.0/0",
                    "via": str(subnets[0][1]),
                    "metric": 100,
                },
            ],
        },
    }

    ethernets.update(
        (
            "ens%d" % (index + 4), {
                "dhcp4": False,
                "dhcp6": False,
                "addresses": ["%s/%d" % (str(subnet[2]), subnet.prefixlen)],
                "nameservers": {
                    "addresses": [str(subnet[2])],
                    "search": ["%s.local" % vpc_id],
                },
            }
        )
        for index, subnet in enumerate(subnets[1:])  # ignore "gw" network
    )

    return {
        "yaml": yaml.dump({
            "version": 2,
            "ethernets": ethernets,
        }),
    }


if __name__ == "__main__":
    network_config()


# vim:ts=4:sw=4:et:syn=python:
