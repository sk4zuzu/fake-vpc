#!/usr/bin/env python3

import textwrap


def openssh():
    ssh_config = textwrap.dedent("""
    Host *
        SendEnv LANG LC_*
        ForwardAgent yes
        StrictHostKeyChecking no
        GlobalKnownHostsFile /dev/null
        UserKnownHostsFile /dev/null
    """)

    with open("/etc/ssh/ssh_config", "w") as config_file:
        config_file.write(ssh_config)


if __name__ == "__main__":
    openssh()


# vim:ts=4:sw=4:et:syn=python:
