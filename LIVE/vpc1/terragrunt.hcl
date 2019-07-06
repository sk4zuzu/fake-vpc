
include {
    path = "${find_in_parent_folders()}"
}

terraform {
    source = "../../tf-vpc-libvirt/"
}

inputs = {
    vpc_id = "vpc1"

    ssh_keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQjHuvVYd25I+q8KPda3PHBSzyFytHcaeQuNQEKdVpf",
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINYG/4jbiwJuTXgsQq2Ao+UGfBNYp6CC48NDfwDOEndb",
    ]

    base_images = {
        utl = "../../../../../pkr-utl-ubuntu-18.04-libvirt/ubuntu-18.04-server-cloudimg-amd64.vmdk/qcow2"
        vpc = "../../../../../pkr-vpc-ubuntu-18.04-libvirt/ubuntu-18.04-server-cloudimg-amd64.vmdk/qcow2"
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
            memory = "1024"
        },
    ]

    vpc_hosts = [
        {
            name    = "vpc1a"
            vcpu    = 8
            memory  = "12288"
            pool    = "vg0"
            storage = "51539607552"
        },
        {
            name    = "vpc1b"
            vcpu    = 8
            memory  = "12288"
            pool    = "vg0"
            storage = "51539607552"
        },
        {
            name    = "vpc1c"
            vcpu    = 8
            memory  = "12288"
            pool    = "vg0"
            storage = "51539607552"
        },
    ]
}

# vim:ts=4:sw=4:et:
