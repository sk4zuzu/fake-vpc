#!/usr/bin/env python3

from terraform_external_data import terraform_external_data

import socket


@terraform_external_data
def hostname(query):
    return {
        "hostname": socket.gethostname(),
    }


if __name__ == "__main__":
    hostname()


# vim:ts=4:sw=4:et:syn=python:
