#!/usr/bin/env python3

from terraform_external_data import terraform_external_data

import json
import yaml
import ipaddress


@terraform_external_data
def network_config(query):
    index, vpc_id, networks = (
        int(query["index"]),
        query["vpc_id"],
        json.loads(query["networks_json"]),
    )

    subnets = [
        ipaddress.ip_network(network["subnet"])
        for network in networks[1:]  # ignoring "gw" network
    ]

    ethernets = {
        "ens3": {
            "dhcp4": False,
            "dhcp6": False,
        },
    }

    bridges = {
        networks[1:][index]["name"]: {
            "dhcp4": False,
            "dhcp6": False,
            "macaddress": networks[1:][index]["macaddr"] % 10,
            "addresses": ["%s/%d" % (str(subnets[index][10]), subnets[index].prefixlen)],
            "gateway4": str(subnets[index][2]),
            "nameservers": {
                "addresses": [str(subnets[index][2])],
                "search": ["%s.local" % vpc_id],
            },
            "interfaces": ["ens3"],
        }
    }

    return {
        "yaml": yaml.dump({
            "version": 2,
            "ethernets": ethernets,
            "bridges": bridges,
        }),
    }


if __name__ == "__main__":
    network_config()


# vim:ts=4:sw=4:et:syn=python:
