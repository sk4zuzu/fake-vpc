
```bash
$ make vpc-apply
```
```
cd /home/asd/_git/fake-vpc/packer/utl/ && make build
make[1]: Entering directory '/home/asd/_git/fake-vpc/packer/utl'
make[1]: Nothing to be done for 'build'.
make[1]: Leaving directory '/home/asd/_git/fake-vpc/packer/utl'
cd /home/asd/_git/fake-vpc/packer/vpc/ && make build
make[1]: Entering directory '/home/asd/_git/fake-vpc/packer/vpc'
make[1]: Nothing to be done for 'build'.
make[1]: Leaving directory '/home/asd/_git/fake-vpc/packer/vpc'
pipenv run sh -c "cd /home/asd/_git/fake-vpc/LIVE/vpc1/ && terragrunt apply"
[terragrunt] 2020/02/16 19:37:19 Reading Terragrunt config file at /home/asd/_git/fake-vpc/LIVE/vpc1/terragrunt.hcl
[terragrunt] [/home/asd/_git/fake-vpc/LIVE/vpc1] 2020/02/16 19:37:19 Running command: terraform --version
[terragrunt] 2020/02/16 19:37:19 WARNING: no double-slash (//) found in source URL /home/asd/_git/fake-vpc/terraform/vpc. Relative paths in downloaded Terraform code may not work.
[terragrunt] 2020/02/16 19:37:19 Downloading Terraform configurations from file:///home/asd/_git/fake-vpc/terraform/vpc into /home/asd/_git/fake-vpc/LIVE/vpc1/.terragrunt-cache/SdKwSZ7_uBgPamt1v_tz5Jyc2Ac/jlnY2jvd0WykwrUKoiSp5Nvcduw
[terragrunt] 2020/02/16 19:37:19 Copying files from /home/asd/_git/fake-vpc/LIVE/vpc1 into /home/asd/_git/fake-vpc/LIVE/vpc1/.terragrunt-cache/SdKwSZ7_uBgPamt1v_tz5Jyc2Ac/jlnY2jvd0WykwrUKoiSp5Nvcduw
[terragrunt] 2020/02/16 19:37:19 Setting working directory to /home/asd/_git/fake-vpc/LIVE/vpc1/.terragrunt-cache/SdKwSZ7_uBgPamt1v_tz5Jyc2Ac/jlnY2jvd0WykwrUKoiSp5Nvcduw
[terragrunt] 2020/02/16 19:37:19 Running command: terraform apply
module.utl.data.external.hostname[0]: Refreshing state...
module.utl.data.external.network_config[0]: Refreshing state...
module.vpc.data.external.network_config[2]: Refreshing state...
module.vpc.data.external.network_config[0]: Refreshing state...
module.vpc.data.external.network_config[1]: Refreshing state...

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # libvirt_network.vpc[0] will be created
  + resource "libvirt_network" "vpc" {
      + addresses = [
	  + "10.10.1.0/24",
	]
      + autostart = true
      + bridge	 = "vpc1a"
      + domain	 = "vpc1.local"
      + id	 = (known after apply)
      + mode	 = "route"
      + name	 = "vpc1a"

      + dhcp {
	  + enabled = false
	}

      + dns {
	  + enabled    = false
	  + local_only = false
	}
    }

  # libvirt_network.vpc[1] will be created
  + resource "libvirt_network" "vpc" {
      + addresses = [
	  + "10.10.2.0/24",
	]
      + autostart = true
      + bridge	 = "vpc1b"
      + domain	 = "vpc1.local"
      + id	 = (known after apply)
      + mode	 = "route"
      + name	 = "vpc1b"

      + dhcp {
	  + enabled = false
	}

      + dns {
	  + enabled    = false
	  + local_only = false
	}
    }

  # libvirt_network.vpc[2] will be created
  + resource "libvirt_network" "vpc" {
      + addresses = [
	  + "10.10.3.0/24",
	]
      + autostart = true
      + bridge	 = "vpc1c"
      + domain	 = "vpc1.local"
      + id	 = (known after apply)
      + mode	 = "route"
      + name	 = "vpc1c"

      + dhcp {
	  + enabled = false
	}

      + dns {
	  + enabled    = false
	  + local_only = false
	}
    }

  # libvirt_network.vpc_gw[0] will be created
  + resource "libvirt_network" "vpc_gw" {
      + addresses = [
	  + "10.69.0.0/16",
	]
      + autostart = true
      + bridge	 = "vpc1gw"
      + domain	 = "vpc1.local"
      + id	 = (known after apply)
      + mode	 = "nat"
      + name	 = "vpc1gw"

      + dhcp {
	  + enabled = true
	}

      + dns {
	  + enabled    = false
	  + local_only = false
	}
    }

  # libvirt_pool.fake_vpc will be created
  + resource "libvirt_pool" "fake_vpc" {
      + allocation = (known after apply)
      + available  = (known after apply)
      + capacity	  = (known after apply)
      + id	  = (known after apply)
      + name	  = "fake_vpc"
      + path	  = "/stor/libvirt/fake_vpc"
      + type	  = "dir"
    }

  # module.utl.libvirt_cloudinit_disk.utl[0] will be created
  + resource "libvirt_cloudinit_disk" "utl" {
      + id	      = (known after apply)
      + meta_data      = <<~EOT
	    instance-id: "vpc1u"
	    local-hostname: "vpc1u"
	EOT
      + name	      = "vpc1u.iso"
      + network_config = <<~EOT
	    ethernets:
	      ens3:
		addresses:
		- 10.69.0.10/16
		dhcp4: false
		dhcp6: false
		routes:
		- metric: 100
		  to: 0.0.0.0/0
		  via: 10.69.0.1
	      ens4:
		addresses:
		- 10.10.1.2/24
		dhcp4: false
		dhcp6: false
		nameservers:
		  addresses:
		  - 10.10.1.2
		  search:
		  - vpc1.local
	      ens5:
		addresses:
		- 10.10.2.2/24
		dhcp4: false
		dhcp6: false
		nameservers:
		  addresses:
		  - 10.10.2.2
		  search:
		  - vpc1.local
	      ens6:
		addresses:
		- 10.10.3.2/24
		dhcp4: false
		dhcp6: false
		nameservers:
		  addresses:
		  - 10.10.3.2
		  search:
		  - vpc1.local
	    version: 2
	EOT
      + pool	      = "fake_vpc"
      + user_data      = <<~EOT
	    #cloud-config
	    ssh_pwauth: false
	    users:
	      - name: ubuntu
		ssh_authorized_keys: ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6bat+JzTBMXItsaKikzHSRmOgD31vpl3W/q6C9rba2 asd@peon\n"]
	      - name: root
		ssh_authorized_keys: ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6bat+JzTBMXItsaKikzHSRmOgD31vpl3W/q6C9rba2 asd@peon\n"]
	    chpasswd:
	      list:
		- ubuntu:#ubuntu@!?
	      expire: false
	    growpart:
	      mode: auto
	      devices: ["/"]
	    write_files:
	      - content: |
		  net.ipv4.ip_forward = 1
		path: /etc/sysctl.d/98-ip-forward.conf
	    runcmd:
	      - ["sysctl", "-p", "/etc/sysctl.d/98-ip-forward.conf"]
	EOT
    }

  # module.utl.libvirt_domain.utl[0] will be created
  + resource "libvirt_domain" "utl" {
      + arch	   = (known after apply)
      + autostart   = true
      + cloudinit   = (known after apply)
      + emulator	   = (known after apply)
      + fw_cfg_name = "opt/com.coreos/config"
      + id	   = (known after apply)
      + machine	   = (known after apply)
      + memory	   = 512
      + name	   = "vpc1u"
      + qemu_agent  = false
      + running	   = true
      + vcpu	   = 1

      + console {
	  + source_host	  = "127.0.0.1"
	  + source_service = "0"
	  + target_port	  = "0"
	  + target_type	  = "serial"
	  + type		  = "pty"
	}
      + console {
	  + source_host	  = "127.0.0.1"
	  + source_service = "0"
	  + target_port	  = "1"
	  + target_type	  = "virtio"
	  + type		  = "pty"
	}

      + disk {
	  + scsi	     = false
	  + volume_id = (known after apply)
	}

      + graphics {
	  + autoport	  = true
	  + listen_address = "127.0.0.1"
	  + listen_type	  = "address"
	  + type		  = "spice"
	}

      + network_interface {
	  + addresses	  = (known after apply)
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = "vpc1gw"
	  + wait_for_lease = false
	}
      + network_interface {
	  + addresses	  = (known after apply)
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = "vpc1a"
	  + wait_for_lease = false
	}
      + network_interface {
	  + addresses	  = (known after apply)
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = "vpc1b"
	  + wait_for_lease = false
	}
      + network_interface {
	  + addresses	  = (known after apply)
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = "vpc1c"
	  + wait_for_lease = false
	}
    }

  # module.utl.libvirt_volume.utl[0] will be created
  + resource "libvirt_volume" "utl" {
      + base_volume_id = (known after apply)
      + format	      = (known after apply)
      + id	      = (known after apply)
      + name	      = "vpc1u"
      + pool	      = "fake_vpc"
      + size	      = (known after apply)
    }

  # module.utl.libvirt_volume.utl_base[0] will be created
  + resource "libvirt_volume" "utl_base" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "vpc1_utl_base"
      + pool   = "fake_vpc"
      + size   = (known after apply)
      + source = "../../../../../packer/utl/.cache/output/packer-utl.qcow2"
    }

  # module.utl.null_resource.utl[0] will be created
  + resource "null_resource" "utl" {
      + id	= (known after apply)
      + triggers = (known after apply)
    }

  # module.vpc.libvirt_cloudinit_disk.vpc[0] will be created
  + resource "libvirt_cloudinit_disk" "vpc" {
      + id	      = (known after apply)
      + meta_data      = <<~EOT
	    instance-id: "vpc1a"
	    local-hostname: "vpc1a"
	EOT
      + name	      = "vpc1a.iso"
      + network_config = <<~EOT
	    bridges:
	      vpc1a:
		addresses:
		- 10.10.1.10/24
		dhcp4: false
		dhcp6: false
		gateway4: 10.10.1.2
		interfaces:
		- ens3
		macaddress: 52:54:00:10:01:0a
		nameservers:
		  addresses:
		  - 10.10.1.2
		  search:
		  - vpc1.local
		parameters: {}
	    ethernets:
	      ens3:
		dhcp4: false
		dhcp6: false
	    version: 2
	EOT
      + pool	      = "fake_vpc"
      + user_data      = <<~EOT
	    #cloud-config
	    ssh_pwauth: false
	    users:
	      - name: ubuntu
		ssh_authorized_keys: ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6bat+JzTBMXItsaKikzHSRmOgD31vpl3W/q6C9rba2 asd@peon\n"]
	      - name: root
		ssh_authorized_keys: ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6bat+JzTBMXItsaKikzHSRmOgD31vpl3W/q6C9rba2 asd@peon\n"]
	    chpasswd:
	      list:
		- ubuntu:#ubuntu@!?
	      expire: false
	    growpart:
	      mode: auto
	      devices: ["/"]
	    fs_setup:
	      - label: images
		filesystem: xfs
		device: "/dev/vdb"
		overwrite: false
	    mounts:
	      - ["/dev/vdb", "/var/lib/libvirt/images/", xfs, "defaults,noatime,nodiratime", 0, 0]
	    write_files:
	      - content: |
		  net.ipv4.ip_forward = 1
		path: /etc/sysctl.d/98-ip-forward.conf
	    runcmd:
	      - ["sysctl", "-p", "/etc/sysctl.d/98-ip-forward.conf"]
	EOT
    }

  # module.vpc.libvirt_cloudinit_disk.vpc[1] will be created
  + resource "libvirt_cloudinit_disk" "vpc" {
      + id	      = (known after apply)
      + meta_data      = <<~EOT
	    instance-id: "vpc1b"
	    local-hostname: "vpc1b"
	EOT
      + name	      = "vpc1b.iso"
      + network_config = <<~EOT
	    bridges:
	      vpc1b:
		addresses:
		- 10.10.2.10/24
		dhcp4: false
		dhcp6: false
		gateway4: 10.10.2.2
		interfaces:
		- ens3
		macaddress: 52:54:00:10:02:0a
		nameservers:
		  addresses:
		  - 10.10.2.2
		  search:
		  - vpc1.local
		parameters: {}
	    ethernets:
	      ens3:
		dhcp4: false
		dhcp6: false
	    version: 2
	EOT
      + pool	      = "fake_vpc"
      + user_data      = <<~EOT
	    #cloud-config
	    ssh_pwauth: false
	    users:
	      - name: ubuntu
		ssh_authorized_keys: ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6bat+JzTBMXItsaKikzHSRmOgD31vpl3W/q6C9rba2 asd@peon\n"]
	      - name: root
		ssh_authorized_keys: ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6bat+JzTBMXItsaKikzHSRmOgD31vpl3W/q6C9rba2 asd@peon\n"]
	    chpasswd:
	      list:
		- ubuntu:#ubuntu@!?
	      expire: false
	    growpart:
	      mode: auto
	      devices: ["/"]
	    fs_setup:
	      - label: images
		filesystem: xfs
		device: "/dev/vdb"
		overwrite: false
	    mounts:
	      - ["/dev/vdb", "/var/lib/libvirt/images/", xfs, "defaults,noatime,nodiratime", 0, 0]
	    write_files:
	      - content: |
		  net.ipv4.ip_forward = 1
		path: /etc/sysctl.d/98-ip-forward.conf
	    runcmd:
	      - ["sysctl", "-p", "/etc/sysctl.d/98-ip-forward.conf"]
	EOT
    }

  # module.vpc.libvirt_cloudinit_disk.vpc[2] will be created
  + resource "libvirt_cloudinit_disk" "vpc" {
      + id	      = (known after apply)
      + meta_data      = <<~EOT
	    instance-id: "vpc1c"
	    local-hostname: "vpc1c"
	EOT
      + name	      = "vpc1c.iso"
      + network_config = <<~EOT
	    bridges:
	      vpc1c:
		addresses:
		- 10.10.3.10/24
		dhcp4: false
		dhcp6: false
		gateway4: 10.10.3.2
		interfaces:
		- ens3
		macaddress: 52:54:00:10:03:0a
		nameservers:
		  addresses:
		  - 10.10.3.2
		  search:
		  - vpc1.local
		parameters: {}
	    ethernets:
	      ens3:
		dhcp4: false
		dhcp6: false
	    version: 2
	EOT
      + pool	      = "fake_vpc"
      + user_data      = <<~EOT
	    #cloud-config
	    ssh_pwauth: false
	    users:
	      - name: ubuntu
		ssh_authorized_keys: ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6bat+JzTBMXItsaKikzHSRmOgD31vpl3W/q6C9rba2 asd@peon\n"]
	      - name: root
		ssh_authorized_keys: ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO6bat+JzTBMXItsaKikzHSRmOgD31vpl3W/q6C9rba2 asd@peon\n"]
	    chpasswd:
	      list:
		- ubuntu:#ubuntu@!?
	      expire: false
	    growpart:
	      mode: auto
	      devices: ["/"]
	    fs_setup:
	      - label: images
		filesystem: xfs
		device: "/dev/vdb"
		overwrite: false
	    mounts:
	      - ["/dev/vdb", "/var/lib/libvirt/images/", xfs, "defaults,noatime,nodiratime", 0, 0]
	    write_files:
	      - content: |
		  net.ipv4.ip_forward = 1
		path: /etc/sysctl.d/98-ip-forward.conf
	    runcmd:
	      - ["sysctl", "-p", "/etc/sysctl.d/98-ip-forward.conf"]
	EOT
    }

  # module.vpc.libvirt_domain.vpc[0] will be created
  + resource "libvirt_domain" "vpc" {
      + arch	   = (known after apply)
      + autostart   = true
      + cloudinit   = (known after apply)
      + cpu	   = {
	  + "mode" = "host-passthrough"
	}
      + emulator	   = (known after apply)
      + fw_cfg_name = "opt/com.coreos/config"
      + id	   = (known after apply)
      + machine	   = (known after apply)
      + memory	   = 3096
      + name	   = "vpc1a"
      + qemu_agent  = false
      + running	   = true
      + vcpu	   = 4

      + console {
	  + source_host	  = "127.0.0.1"
	  + source_service = "0"
	  + target_port	  = "0"
	  + target_type	  = "serial"
	  + type		  = "pty"
	}
      + console {
	  + source_host	  = "127.0.0.1"
	  + source_service = "0"
	  + target_port	  = "1"
	  + target_type	  = "virtio"
	  + type		  = "pty"
	}

      + disk {
	  + scsi	     = false
	  + volume_id = (known after apply)
	}
      + disk {
	  + scsi	     = false
	  + volume_id = (known after apply)
	}

      + graphics {
	  + autoport	  = true
	  + listen_address = "127.0.0.1"
	  + listen_type	  = "address"
	  + type		  = "spice"
	}

      + network_interface {
	  + addresses	  = (known after apply)
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = "vpc1a"
	  + wait_for_lease = false
	}
    }

  # module.vpc.libvirt_domain.vpc[1] will be created
  + resource "libvirt_domain" "vpc" {
      + arch	   = (known after apply)
      + autostart   = true
      + cloudinit   = (known after apply)
      + cpu	   = {
	  + "mode" = "host-passthrough"
	}
      + emulator	   = (known after apply)
      + fw_cfg_name = "opt/com.coreos/config"
      + id	   = (known after apply)
      + machine	   = (known after apply)
      + memory	   = 3096
      + name	   = "vpc1b"
      + qemu_agent  = false
      + running	   = true
      + vcpu	   = 4

      + console {
	  + source_host	  = "127.0.0.1"
	  + source_service = "0"
	  + target_port	  = "0"
	  + target_type	  = "serial"
	  + type		  = "pty"
	}
      + console {
	  + source_host	  = "127.0.0.1"
	  + source_service = "0"
	  + target_port	  = "1"
	  + target_type	  = "virtio"
	  + type		  = "pty"
	}

      + disk {
	  + scsi	     = false
	  + volume_id = (known after apply)
	}
      + disk {
	  + scsi	     = false
	  + volume_id = (known after apply)
	}

      + graphics {
	  + autoport	  = true
	  + listen_address = "127.0.0.1"
	  + listen_type	  = "address"
	  + type		  = "spice"
	}

      + network_interface {
	  + addresses	  = (known after apply)
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = "vpc1b"
	  + wait_for_lease = false
	}
    }

  # module.vpc.libvirt_domain.vpc[2] will be created
  + resource "libvirt_domain" "vpc" {
      + arch	   = (known after apply)
      + autostart   = true
      + cloudinit   = (known after apply)
      + cpu	   = {
	  + "mode" = "host-passthrough"
	}
      + emulator	   = (known after apply)
      + fw_cfg_name = "opt/com.coreos/config"
      + id	   = (known after apply)
      + machine	   = (known after apply)
      + memory	   = 3096
      + name	   = "vpc1c"
      + qemu_agent  = false
      + running	   = true
      + vcpu	   = 4

      + console {
	  + source_host	  = "127.0.0.1"
	  + source_service = "0"
	  + target_port	  = "0"
	  + target_type	  = "serial"
	  + type		  = "pty"
	}
      + console {
	  + source_host	  = "127.0.0.1"
	  + source_service = "0"
	  + target_port	  = "1"
	  + target_type	  = "virtio"
	  + type		  = "pty"
	}

      + disk {
	  + scsi	     = false
	  + volume_id = (known after apply)
	}
      + disk {
	  + scsi	     = false
	  + volume_id = (known after apply)
	}

      + graphics {
	  + autoport	  = true
	  + listen_address = "127.0.0.1"
	  + listen_type	  = "address"
	  + type		  = "spice"
	}

      + network_interface {
	  + addresses	  = (known after apply)
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = "vpc1c"
	  + wait_for_lease = false
	}
    }

  # module.vpc.libvirt_volume.vpc[0] will be created
  + resource "libvirt_volume" "vpc" {
      + base_volume_id = (known after apply)
      + format	      = (known after apply)
      + id	      = (known after apply)
      + name	      = "vpc1a"
      + pool	      = "fake_vpc"
      + size	      = (known after apply)
    }

  # module.vpc.libvirt_volume.vpc[1] will be created
  + resource "libvirt_volume" "vpc" {
      + base_volume_id = (known after apply)
      + format	      = (known after apply)
      + id	      = (known after apply)
      + name	      = "vpc1b"
      + pool	      = "fake_vpc"
      + size	      = (known after apply)
    }

  # module.vpc.libvirt_volume.vpc[2] will be created
  + resource "libvirt_volume" "vpc" {
      + base_volume_id = (known after apply)
      + format	      = (known after apply)
      + id	      = (known after apply)
      + name	      = "vpc1c"
      + pool	      = "fake_vpc"
      + size	      = (known after apply)
    }

  # module.vpc.libvirt_volume.vpc_base[0] will be created
  + resource "libvirt_volume" "vpc_base" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "vpc1_vpc_base"
      + pool   = "fake_vpc"
      + size   = (known after apply)
      + source = "../../../../../packer/vpc/.cache/output/packer-vpc.qcow2"
    }

  # module.vpc.libvirt_volume.vpc_data[0] will be created
  + resource "libvirt_volume" "vpc_data" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "vpc1a_data"
      + pool   = "fake_vpc"
      + size   = 128849018880
    }

  # module.vpc.libvirt_volume.vpc_data[1] will be created
  + resource "libvirt_volume" "vpc_data" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "vpc1b_data"
      + pool   = "fake_vpc"
      + size   = 128849018880
    }

  # module.vpc.libvirt_volume.vpc_data[2] will be created
  + resource "libvirt_volume" "vpc_data" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "vpc1c_data"
      + pool   = "fake_vpc"
      + size   = 128849018880
    }

Plan: 23 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
libvirt_pool.fake_vpc: Creating...
libvirt_network.vpc[2]: Creating...
libvirt_network.vpc[1]: Creating...
libvirt_network.vpc[0]: Creating...
libvirt_network.vpc_gw[0]: Creating...
libvirt_pool.fake_vpc: Creation complete after 5s [id=91ea2b83-ec2f-493c-adf5-9812e5cb37f4]
module.vpc.libvirt_cloudinit_disk.vpc[0]: Creating...
module.vpc.libvirt_volume.vpc_data[0]: Creating...
module.utl.libvirt_volume.utl_base[0]: Creating...
module.vpc.libvirt_volume.vpc_data[2]: Creating...
module.vpc.libvirt_cloudinit_disk.vpc[1]: Creating...
module.vpc.libvirt_volume.vpc_data[1]: Creating...
libvirt_network.vpc[2]: Creation complete after 6s [id=4b636f59-5eb9-49eb-ae8b-379c26d4484b]
module.vpc.libvirt_volume.vpc_base[0]: Creating...
libvirt_network.vpc[1]: Creation complete after 6s [id=66249979-1ee3-456a-9cda-b47ef6783cf9]
module.utl.libvirt_cloudinit_disk.utl[0]: Creating...
libvirt_network.vpc[0]: Creation complete after 6s [id=470120c8-2a8f-4154-87b5-19ef3e03e9a1]
module.vpc.libvirt_cloudinit_disk.vpc[2]: Creating...
libvirt_network.vpc_gw[0]: Creation complete after 6s [id=d3e1b6c4-8269-4f60-8689-91f31125c20f]
module.vpc.libvirt_volume.vpc_data[0]: Creation complete after 0s [id=/stor/libvirt/fake_vpc/vpc1a_data]
module.vpc.libvirt_volume.vpc_data[2]: Creation complete after 0s [id=/stor/libvirt/fake_vpc/vpc1c_data]
module.vpc.libvirt_cloudinit_disk.vpc[0]: Still creating... [10s elapsed]
module.utl.libvirt_volume.utl_base[0]: Still creating... [10s elapsed]
module.vpc.libvirt_volume.vpc_data[1]: Still creating... [10s elapsed]
module.vpc.libvirt_cloudinit_disk.vpc[1]: Still creating... [10s elapsed]
module.vpc.libvirt_volume.vpc_base[0]: Still creating... [10s elapsed]
module.utl.libvirt_cloudinit_disk.utl[0]: Still creating... [10s elapsed]
module.vpc.libvirt_cloudinit_disk.vpc[2]: Still creating... [10s elapsed]
module.utl.libvirt_volume.utl_base[0]: Creation complete after 17s [id=/stor/libvirt/fake_vpc/vpc1_utl_base]
module.utl.libvirt_volume.utl[0]: Creating...
module.vpc.libvirt_volume.vpc_data[1]: Creation complete after 18s [id=/stor/libvirt/fake_vpc/vpc1b_data]
module.vpc.libvirt_cloudinit_disk.vpc[1]: Creation complete after 18s [id=/stor/libvirt/fake_vpc/vpc1b.iso;5e498bfa-edec-eeea-6c94-b8c70325f7b9]
module.vpc.libvirt_cloudinit_disk.vpc[0]: Creation complete after 18s [id=/stor/libvirt/fake_vpc/vpc1a.iso;5e498bfb-9f47-9cee-9da5-29af89d2e321]
module.vpc.libvirt_volume.vpc_base[0]: Still creating... [20s elapsed]
module.utl.libvirt_cloudinit_disk.utl[0]: Still creating... [20s elapsed]
module.vpc.libvirt_cloudinit_disk.vpc[2]: Still creating... [20s elapsed]
module.utl.libvirt_volume.utl[0]: Still creating... [10s elapsed]
module.vpc.libvirt_volume.vpc_base[0]: Still creating... [30s elapsed]
module.utl.libvirt_cloudinit_disk.utl[0]: Still creating... [30s elapsed]
module.vpc.libvirt_cloudinit_disk.vpc[2]: Still creating... [30s elapsed]
module.utl.libvirt_volume.utl[0]: Still creating... [20s elapsed]
module.vpc.libvirt_volume.vpc_base[0]: Still creating... [40s elapsed]
module.utl.libvirt_cloudinit_disk.utl[0]: Still creating... [40s elapsed]
module.vpc.libvirt_cloudinit_disk.vpc[2]: Still creating... [40s elapsed]
module.vpc.libvirt_volume.vpc_base[0]: Creation complete after 43s [id=/stor/libvirt/fake_vpc/vpc1_vpc_base]
module.vpc.libvirt_volume.vpc[0]: Creating...
module.vpc.libvirt_volume.vpc[2]: Creating...
module.vpc.libvirt_volume.vpc[1]: Creating...
module.utl.libvirt_cloudinit_disk.utl[0]: Creation complete after 45s [id=/stor/libvirt/fake_vpc/vpc1u.iso;5e498c15-617d-a18e-4a38-38532d29cc74]
module.vpc.libvirt_cloudinit_disk.vpc[2]: Creation complete after 45s [id=/stor/libvirt/fake_vpc/vpc1c.iso;5e498c15-34b6-72dc-1d2b-aeba497ebe25]
module.utl.libvirt_volume.utl[0]: Creation complete after 28s [id=/stor/libvirt/fake_vpc/vpc1u]
module.utl.libvirt_domain.utl[0]: Creating...
module.vpc.libvirt_volume.vpc[0]: Creation complete after 2s [id=/stor/libvirt/fake_vpc/vpc1a]
module.vpc.libvirt_volume.vpc[1]: Creation complete after 2s [id=/stor/libvirt/fake_vpc/vpc1b]
module.utl.libvirt_domain.utl[0]: Creation complete after 0s [id=a87a4be5-b15e-4add-ba5c-f8dd0b5fc91a]
module.utl.null_resource.utl[0]: Creating...
module.utl.null_resource.utl[0]: Provisioning with 'file'...
module.vpc.libvirt_volume.vpc[2]: Creation complete after 2s [id=/stor/libvirt/fake_vpc/vpc1c]
module.vpc.libvirt_domain.vpc[2]: Creating...
module.vpc.libvirt_domain.vpc[0]: Creating...
module.vpc.libvirt_domain.vpc[1]: Creating...
module.vpc.libvirt_domain.vpc[2]: Creation complete after 0s [id=58590f3c-9fbc-4fae-a5d4-df5a9f6e3400]
module.vpc.libvirt_domain.vpc[1]: Creation complete after 0s [id=ca78ea41-17c6-4565-9fb7-e082f74242e8]
module.vpc.libvirt_domain.vpc[0]: Creation complete after 0s [id=3ad8231d-97e9-4ffa-9199-b4d63a47f927]
module.utl.null_resource.utl[0]: Still creating... [10s elapsed]
module.utl.null_resource.utl[0]: Still creating... [20s elapsed]
module.utl.null_resource.utl[0]: Still creating... [30s elapsed]
module.utl.null_resource.utl[0]: Still creating... [40s elapsed]
module.utl.null_resource.utl[0]: Provisioning with 'file'...
module.utl.null_resource.utl[0]: Provisioning with 'file'...
module.utl.null_resource.utl[0]: Provisioning with 'remote-exec'...
module.utl.null_resource.utl[0] (remote-exec): Connecting to remote host via SSH...
module.utl.null_resource.utl[0] (remote-exec):	 Host: 10.69.0.10
module.utl.null_resource.utl[0] (remote-exec):	 User: ubuntu
module.utl.null_resource.utl[0] (remote-exec):	 Password: false
module.utl.null_resource.utl[0] (remote-exec):	 Private key: false
module.utl.null_resource.utl[0] (remote-exec):	 Certificate: false
module.utl.null_resource.utl[0] (remote-exec):	 SSH Agent: true
module.utl.null_resource.utl[0] (remote-exec):	 Checking Host Key: false
module.utl.null_resource.utl[0] (remote-exec): Connected!
module.utl.null_resource.utl[0]: Still creating... [50s elapsed]
module.utl.null_resource.utl[0]: Still creating... [0s elapsed]
module.utl.null_resource.utl[0]: Still creating... [10s elapsed]
module.utl.null_resource.utl[0]: Creation complete after 17s [id=2087008199718572930]

Apply complete! Resources: 23 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```

[//]: # ( vim:set ts=2 sw=2 et syn=markdown: )
