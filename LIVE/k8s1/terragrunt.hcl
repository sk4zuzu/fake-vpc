
include {
    path = "${find_in_parent_folders()}"
}

terraform {
    source = "../../terraform/k8s/"
}

inputs = {
    k8s_id = "k1"

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

    master = {
        count   = 3
        vcpu    = 2
        memory  = "2048"
        image   = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2"
        storage = "17179869184"  # 16GiB
    }

    compute = {
        count   = 1
        vcpu    = 2
        memory  = "1024"
        image   = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2"
        storage = "17179869184"  # 16GiB
    }
}

# vim:ts=4:sw=4:et:
