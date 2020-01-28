
include {
    path = "${find_in_parent_folders()}"
}

terraform {
    source = "../../terraform/vpc/"
}

inputs = {
    vpc_id = "vpc1"

    ssh_keys = [
        file("~/.ssh/id_ed25519.pub"),
    ]

    pool_directory = "/stor/libvirt/fake_vpc"

    base_images = {
        utl = "../../../../../packer/utl/.cache/output/packer-utl.qcow2"
        vpc = "../../../../../packer/vpc/.cache/output/packer-vpc.qcow2"
    }

    networks = [
        {
            name    = "vpc1gw"
            subnet  = "10.69.0.0/16"
            macaddr = "52:54:00:69:00:%02x"
        },
        {
            name    = "vpc1a"
            subnet  = "10.10.1.0/24"
            macaddr = "52:54:00:10:01:%02x"
        },
        {
            name    = "vpc1b"
            subnet  = "10.10.2.0/24"
            macaddr = "52:54:00:10:02:%02x"
        },
        {
            name    = "vpc1c"
            subnet  = "10.10.3.0/24"
            macaddr = "52:54:00:10:03:%02x"
        },
    ]

    utl_hosts = [
        {
            name   = "vpc1u"
            vcpu   = 1
            memory = "512"
        },
    ]

    vpc_hosts = [
        {
            name    = "vpc1a"
            vcpu    = 1
            memory  = "3686"
            storage = "34259173344"  # 32GiB
        },
        {
            name    = "vpc1b"
            vcpu    = 1
            memory  = "3686"
            storage = "34259173344"  # 32GiB
        },
        {
            name    = "vpc1c"
            vcpu    = 1
            memory  = "3686"
            storage = "34259173344"  # 32GiB
        },
    ]
}

# vim:ts=4:sw=4:et:
