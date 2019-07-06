
data "external" "hostname" {
    count = "${length(var.utl_hosts) > 0 ? 1 : 0}"

    program = [ "${path.module}/external/hostname.py" ]
}

resource "template_dir" "remote-exec" {
    count = "${length(var.utl_hosts) > 0 ? 1 : 0}"

    source_dir      = "${path.module}/remote-exec/"
    destination_dir = "${path.root}/.cache/${lookup(var.utl_hosts[count.index], "name")}/remote-exec/"

    vars = {
        VPC_ID                  = "${var.vpc_id}"
        NETWORKS_JSON           = "${jsonencode(var.networks)}"
        DHCP_IGNORED_HOSTS_JSON = "${jsonencode(list(lookup(data.external.hostname.*.result[count.index], "hostname")))}"
    }
}

# vim:ts=4:sw=4:et:
