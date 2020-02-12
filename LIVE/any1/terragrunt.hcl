
include {
    path = "${find_in_parent_folders()}"
}

terraform {
    source = "../../terraform/any/"
}

inputs = {
    any_id = "a1"

    availability_zones = [
        {
            name   = "vpc1a"
            subnet = "10.10.1.0/24"
        },
        {
            name   = "vpc1b"
            subnet = "10.10.2.0/24"
        },
        {
            name   = "vpc1c"
            subnet = "10.10.3.0/24"
        },
    ]

    ssh_keys = [
        file("~/.ssh/id_ed25519.pub"),
    ]

    nodes = {
        count   = 3
        vcpu    = 2
        memory  = "2560"
        image   = "../../../../../packer/any/.cache/output/packer-any.qcow2"
        storage = "38654705664"  # 36GiB
        running = true
    }
}

# vim:ts=4:sw=4:et:
