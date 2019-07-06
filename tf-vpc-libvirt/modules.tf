
terraform {
    backend "local" {}
}

module "utl" {
    source     = "./utl/"
    vpc_id     = "${var.vpc_id}"
    ssh_keys   = "${var.ssh_keys}"
    base_image = "${var.base_images["utl"]}"
    networks   = "${var.networks}"
    utl_hosts  = "${var.utl_hosts}"
}

module "vpc" {
    source     = "./vpc/"
    vpc_id     = "${var.vpc_id}"
    ssh_keys   = "${var.ssh_keys}"
    base_image = "${var.base_images["vpc"]}"
    networks   = "${var.networks}"
    vpc_hosts  = "${var.vpc_hosts}"
}

# vim:ts=4:sw=4:et:
