
resource "libvirt_pool" "fake_vpc" {
    name = "fake_vpc"
    type = "dir"
    path = var.pool_directory
}

# vim:ts=4:sw=4:et:
