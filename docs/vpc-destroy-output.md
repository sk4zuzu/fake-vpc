
```bash
$ make vpc-destroy
```
```
pipenv run sh -c "cd /home/asd/_git/fake-vpc/LIVE/vpc1/ && terragrunt destroy"
[terragrunt] 2020/02/16 21:02:02 Reading Terragrunt config file at /home/asd/_git/fake-vpc/LIVE/vpc1/terragrunt.hcl
[terragrunt] [/home/asd/_git/fake-vpc/LIVE/vpc1] 2020/02/16 21:02:02 Running command: terraform --version
[terragrunt] 2020/02/16 21:02:02 WARNING: no double-slash (//) found in source URL /home/asd/_git/fake-vpc/terraform/vpc. Relative paths in downloaded Terraform code may not work.
[terragrunt] 2020/02/16 21:02:02 Downloading Terraform configurations from file:///home/asd/_git/fake-vpc/terraform/vpc into /home/asd/_git/fake-vpc/LIVE/vpc1/.terragrunt-cache/SdKwSZ7_uBgPamt1v_tz5Jyc2Ac/jlnY2jvd0WykwrUKoiSp5Nvcduw
[terragrunt] 2020/02/16 21:02:02 Copying files from /home/asd/_git/fake-vpc/LIVE/vpc1 into /home/asd/_git/fake-vpc/LIVE/vpc1/.terragrunt-cache/SdKwSZ7_uBgPamt1v_tz5Jyc2Ac/jlnY2jvd0WykwrUKoiSp5Nvcduw
[terragrunt] 2020/02/16 21:02:02 Setting working directory to /home/asd/_git/fake-vpc/LIVE/vpc1/.terragrunt-cache/SdKwSZ7_uBgPamt1v_tz5Jyc2Ac/jlnY2jvd0WykwrUKoiSp5Nvcduw
[terragrunt] 2020/02/16 21:02:02 Running command: terraform destroy
libvirt_pool.fake_vpc: Refreshing state... [id=91ea2b83-ec2f-493c-adf5-9812e5cb37f4]
module.utl.data.external.hostname[0]: Refreshing state...
libvirt_network.vpc_gw[0]: Refreshing state... [id=d3e1b6c4-8269-4f60-8689-91f31125c20f]
module.vpc.data.external.network_config[1]: Refreshing state...
libvirt_network.vpc[0]: Refreshing state... [id=470120c8-2a8f-4154-87b5-19ef3e03e9a1]
libvirt_network.vpc[1]: Refreshing state... [id=66249979-1ee3-456a-9cda-b47ef6783cf9]
module.vpc.data.external.network_config[0]: Refreshing state...
libvirt_network.vpc[2]: Refreshing state... [id=4b636f59-5eb9-49eb-ae8b-379c26d4484b]
module.vpc.data.external.network_config[2]: Refreshing state...
module.utl.data.external.network_config[0]: Refreshing state...
module.vpc.libvirt_volume.vpc_data[0]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1a_data]
module.vpc.libvirt_volume.vpc_base[0]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1_vpc_base]
module.vpc.libvirt_volume.vpc_data[2]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1c_data]
module.vpc.libvirt_volume.vpc_data[1]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1b_data]
module.utl.libvirt_volume.utl_base[0]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1_utl_base]
module.vpc.libvirt_cloudinit_disk.vpc[1]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1b.iso;5e498bfa-edec-eeea-6c94-b8c70325f7b9]
module.vpc.libvirt_cloudinit_disk.vpc[2]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1c.iso;5e498c15-34b6-72dc-1d2b-aeba497ebe25]
module.vpc.libvirt_cloudinit_disk.vpc[0]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1a.iso;5e498bfb-9f47-9cee-9da5-29af89d2e321]
module.utl.libvirt_cloudinit_disk.utl[0]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1u.iso;5e498c15-617d-a18e-4a38-38532d29cc74]
module.vpc.libvirt_volume.vpc[2]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1c]
module.vpc.libvirt_volume.vpc[0]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1a]
module.vpc.libvirt_volume.vpc[1]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1b]
module.utl.libvirt_volume.utl[0]: Refreshing state... [id=/stor/libvirt/fake_vpc/vpc1u]
module.vpc.libvirt_domain.vpc[1]: Refreshing state... [id=ca78ea41-17c6-4565-9fb7-e082f74242e8]
module.vpc.libvirt_domain.vpc[0]: Refreshing state... [id=3ad8231d-97e9-4ffa-9199-b4d63a47f927]
module.utl.libvirt_domain.utl[0]: Refreshing state... [id=a87a4be5-b15e-4add-ba5c-f8dd0b5fc91a]
module.vpc.libvirt_domain.vpc[2]: Refreshing state... [id=58590f3c-9fbc-4fae-a5d4-df5a9f6e3400]
module.utl.null_resource.utl[0]: Refreshing state... [id=2087008199718572930]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + destroy

Terraform will perform the following actions:

  # libvirt_network.vpc[0] will be destroyed
  + resource "libvirt_network" "vpc" {
      + addresses = [
	  + "10.10.1.0/24",
	] -> null
      + autostart = true -> null
      + bridge	 = "vpc1a" -> null
      + domain	 = "vpc1.local" -> null
      + id	 = "470120c8-2a8f-4154-87b5-19ef3e03e9a1" -> null
      + mode	 = "route" -> null
      + name	 = "vpc1a" -> null

      + dhcp {
	  + enabled = false -> null
	}

      + dns {
	  + enabled    = false -> null
	  + local_only = false -> null
	}
    }

  # libvirt_network.vpc[1] will be destroyed
  + resource "libvirt_network" "vpc" {
      + addresses = [
	  + "10.10.2.0/24",
	] -> null
      + autostart = true -> null
      + bridge	 = "vpc1b" -> null
      + domain	 = "vpc1.local" -> null
      + id	 = "66249979-1ee3-456a-9cda-b47ef6783cf9" -> null
      + mode	 = "route" -> null
      + name	 = "vpc1b" -> null

      + dhcp {
	  + enabled = false -> null
	}

      + dns {
	  + enabled    = false -> null
	  + local_only = false -> null
	}
    }

  # libvirt_network.vpc[2] will be destroyed
  + resource "libvirt_network" "vpc" {
      + addresses = [
	  + "10.10.3.0/24",
	] -> null
      + autostart = true -> null
      + bridge	 = "vpc1c" -> null
      + domain	 = "vpc1.local" -> null
      + id	 = "4b636f59-5eb9-49eb-ae8b-379c26d4484b" -> null
      + mode	 = "route" -> null
      + name	 = "vpc1c" -> null

      + dhcp {
	  + enabled = false -> null
	}

      + dns {
	  + enabled    = false -> null
	  + local_only = false -> null
	}
    }

  # libvirt_network.vpc_gw[0] will be destroyed
  + resource "libvirt_network" "vpc_gw" {
      + addresses = [
	  + "10.69.0.0/16",
	] -> null
      + autostart = true -> null
      + bridge	 = "vpc1gw" -> null
      + domain	 = "vpc1.local" -> null
      + id	 = "d3e1b6c4-8269-4f60-8689-91f31125c20f" -> null
      + mode	 = "nat" -> null
      + name	 = "vpc1gw" -> null

      + dhcp {
	  + enabled = true -> null
	}

      + dns {
	  + enabled    = false -> null
	  + local_only = false -> null
	}
    }

  # libvirt_pool.fake_vpc will be destroyed
  + resource "libvirt_pool" "fake_vpc" {
      + allocation = 5377302528 -> null
      + capacity	  = 983426940928 -> null
      + id	  = "91ea2b83-ec2f-493c-adf5-9812e5cb37f4" -> null
      + name	  = "fake_vpc" -> null
      + path	  = "/stor/libvirt/fake_vpc" -> null
      + type	  = "dir" -> null
    }

  # module.utl.libvirt_cloudinit_disk.utl[0] will be destroyed
  + resource "libvirt_cloudinit_disk" "utl" {
      + id	      = "/stor/libvirt/fake_vpc/vpc1u.iso;5e498c15-617d-a18e-4a38-38532d29cc74" -> null
      + meta_data      = <<~EOT
	    instance-id: "vpc1u"
	    local-hostname: "vpc1u"
	EOT -> null
      + name	      = "vpc1u.iso" -> null
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
	EOT -> null
      + pool	      = "fake_vpc" -> null
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
	EOT -> null
    }

  # module.utl.libvirt_domain.utl[0] will be destroyed
  + resource "libvirt_domain" "utl" {
      + arch	   = "x86_64" -> null
      + autostart   = true -> null
      + cloudinit   = "/stor/libvirt/fake_vpc/vpc1u.iso;5e498c15-617d-a18e-4a38-38532d29cc74" -> null
      + cmdline	   = [] -> null
      + emulator	   = "/run/libvirt/nix-emulators/qemu-system-x86_64" -> null
      + fw_cfg_name = "opt/com.coreos/config" -> null
      + id	   = "a87a4be5-b15e-4add-ba5c-f8dd0b5fc91a" -> null
      + machine	   = "pc" -> null
      + memory	   = 512 -> null
      + name	   = "vpc1u" -> null
      + qemu_agent  = false -> null
      + running	   = true -> null
      + vcpu	   = 1 -> null

      + console {
	  + source_host	  = "127.0.0.1" -> null
	  + source_service = "0" -> null
	  + target_port	  = "0" -> null
	  + target_type	  = "serial" -> null
	  + type		  = "pty" -> null
	}
      + console {
	  + source_host	  = "127.0.0.1" -> null
	  + source_service = "0" -> null
	  + target_port	  = "1" -> null
	  + target_type	  = "virtio" -> null
	  + type		  = "pty" -> null
	}

      + disk {
	  + scsi	     = false -> null
	  + volume_id = "/stor/libvirt/fake_vpc/vpc1u" -> null
	}

      + graphics {
	  + autoport	  = true -> null
	  + listen_address = "127.0.0.1" -> null
	  + listen_type	  = "address" -> null
	  + type		  = "spice" -> null
	}

      + network_interface {
	  + addresses	  = [] -> null
	  + mac		  = "52:54:00:F6:CF:AE" -> null
	  + network_id	  = "d3e1b6c4-8269-4f60-8689-91f31125c20f" -> null
	  + network_name	  = "vpc1gw" -> null
	  + wait_for_lease = false -> null
	}
      + network_interface {
	  + addresses	  = [] -> null
	  + mac		  = "52:54:00:5A:0B:6E" -> null
	  + network_id	  = "470120c8-2a8f-4154-87b5-19ef3e03e9a1" -> null
	  + network_name	  = "vpc1a" -> null
	  + wait_for_lease = false -> null
	}
      + network_interface {
	  + addresses	  = [] -> null
	  + mac		  = "52:54:00:5A:17:48" -> null
	  + network_id	  = "66249979-1ee3-456a-9cda-b47ef6783cf9" -> null
	  + network_name	  = "vpc1b" -> null
	  + wait_for_lease = false -> null
	}
      + network_interface {
	  + addresses	  = [] -> null
	  + mac		  = "52:54:00:92:5A:47" -> null
	  + network_id	  = "4b636f59-5eb9-49eb-ae8b-379c26d4484b" -> null
	  + network_name	  = "vpc1c" -> null
	  + wait_for_lease = false -> null
	}
    }

  # module.utl.libvirt_volume.utl[0] will be destroyed
  + resource "libvirt_volume" "utl" {
      + base_volume_id = "/stor/libvirt/fake_vpc/vpc1_utl_base" -> null
      + format	      = "qcow2" -> null
      + id	      = "/stor/libvirt/fake_vpc/vpc1u" -> null
      + name	      = "vpc1u" -> null
      + pool	      = "fake_vpc" -> null
      + size	      = 10737418240 -> null
    }

  # module.utl.libvirt_volume.utl_base[0] will be destroyed
  + resource "libvirt_volume" "utl_base" {
      + format = "qcow2" -> null
      + id     = "/stor/libvirt/fake_vpc/vpc1_utl_base" -> null
      + name   = "vpc1_utl_base" -> null
      + pool   = "fake_vpc" -> null
      + size   = 10737418240 -> null
      + source = "../../../../../packer/utl/.cache/output/packer-utl.qcow2" -> null
    }

  # module.utl.null_resource.utl[0] will be destroyed
  + resource "null_resource" "utl" {
      + id	= "2087008199718572930" -> null
      + triggers = {
	  + "always" = "1db453ba-ae14-d2d9-56c8-f6a519527844"
	} -> null
    }

  # module.vpc.libvirt_cloudinit_disk.vpc[0] will be destroyed
  + resource "libvirt_cloudinit_disk" "vpc" {
      + id	      = "/stor/libvirt/fake_vpc/vpc1a.iso;5e498bfb-9f47-9cee-9da5-29af89d2e321" -> null
      + meta_data      = <<~EOT
	    instance-id: "vpc1a"
	    local-hostname: "vpc1a"
	EOT -> null
      + name	      = "vpc1a.iso" -> null
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
	EOT -> null
      + pool	      = "fake_vpc" -> null
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
	EOT -> null
    }

  # module.vpc.libvirt_cloudinit_disk.vpc[1] will be destroyed
  + resource "libvirt_cloudinit_disk" "vpc" {
      + id	      = "/stor/libvirt/fake_vpc/vpc1b.iso;5e498bfa-edec-eeea-6c94-b8c70325f7b9" -> null
      + meta_data      = <<~EOT
	    instance-id: "vpc1b"
	    local-hostname: "vpc1b"
	EOT -> null
      + name	      = "vpc1b.iso" -> null
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
	EOT -> null
      + pool	      = "fake_vpc" -> null
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
	EOT -> null
    }

  # module.vpc.libvirt_cloudinit_disk.vpc[2] will be destroyed
  + resource "libvirt_cloudinit_disk" "vpc" {
      + id	      = "/stor/libvirt/fake_vpc/vpc1c.iso;5e498c15-34b6-72dc-1d2b-aeba497ebe25" -> null
      + meta_data      = <<~EOT
	    instance-id: "vpc1c"
	    local-hostname: "vpc1c"
	EOT -> null
      + name	      = "vpc1c.iso" -> null
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
	EOT -> null
      + pool	      = "fake_vpc" -> null
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
	EOT -> null
    }

  # module.vpc.libvirt_domain.vpc[0] will be destroyed
  + resource "libvirt_domain" "vpc" {
      + arch	   = "x86_64" -> null
      + autostart   = true -> null
      + cloudinit   = "/stor/libvirt/fake_vpc/vpc1a.iso;5e498bfb-9f47-9cee-9da5-29af89d2e321" -> null
      + cmdline	   = [] -> null
      + cpu	   = {
	  + "mode" = "host-passthrough"
	} -> null
      + emulator	   = "/run/libvirt/nix-emulators/qemu-system-x86_64" -> null
      + fw_cfg_name = "opt/com.coreos/config" -> null
      + id	   = "3ad8231d-97e9-4ffa-9199-b4d63a47f927" -> null
      + machine	   = "pc" -> null
      + memory	   = 3096 -> null
      + name	   = "vpc1a" -> null
      + qemu_agent  = false -> null
      + running	   = true -> null
      + vcpu	   = 4 -> null

      + console {
	  + source_host	  = "127.0.0.1" -> null
	  + source_service = "0" -> null
	  + target_port	  = "0" -> null
	  + target_type	  = "serial" -> null
	  + type		  = "pty" -> null
	}
      + console {
	  + source_host	  = "127.0.0.1" -> null
	  + source_service = "0" -> null
	  + target_port	  = "1" -> null
	  + target_type	  = "virtio" -> null
	  + type		  = "pty" -> null
	}

      + disk {
	  + scsi	     = false -> null
	  + volume_id = "/stor/libvirt/fake_vpc/vpc1a" -> null
	}
      + disk {
	  + scsi	     = false -> null
	  + volume_id = "/stor/libvirt/fake_vpc/vpc1a_data" -> null
	}

      + graphics {
	  + autoport	  = true -> null
	  + listen_address = "127.0.0.1" -> null
	  + listen_type	  = "address" -> null
	  + type		  = "spice" -> null
	}

      + network_interface {
	  + addresses	  = [] -> null
	  + mac		  = "52:54:00:12:2B:B3" -> null
	  + network_id	  = "470120c8-2a8f-4154-87b5-19ef3e03e9a1" -> null
	  + network_name	  = "vpc1a" -> null
	  + wait_for_lease = false -> null
	}
    }

  # module.vpc.libvirt_domain.vpc[1] will be destroyed
  + resource "libvirt_domain" "vpc" {
      + arch	   = "x86_64" -> null
      + autostart   = true -> null
      + cloudinit   = "/stor/libvirt/fake_vpc/vpc1b.iso;5e498bfa-edec-eeea-6c94-b8c70325f7b9" -> null
      + cmdline	   = [] -> null
      + cpu	   = {
	  + "mode" = "host-passthrough"
	} -> null
      + emulator	   = "/run/libvirt/nix-emulators/qemu-system-x86_64" -> null
      + fw_cfg_name = "opt/com.coreos/config" -> null
      + id	   = "ca78ea41-17c6-4565-9fb7-e082f74242e8" -> null
      + machine	   = "pc" -> null
      + memory	   = 3096 -> null
      + name	   = "vpc1b" -> null
      + qemu_agent  = false -> null
      + running	   = true -> null
      + vcpu	   = 4 -> null

      + console {
	  + source_host	  = "127.0.0.1" -> null
	  + source_service = "0" -> null
	  + target_port	  = "0" -> null
	  + target_type	  = "serial" -> null
	  + type		  = "pty" -> null
	}
      + console {
	  + source_host	  = "127.0.0.1" -> null
	  + source_service = "0" -> null
	  + target_port	  = "1" -> null
	  + target_type	  = "virtio" -> null
	  + type		  = "pty" -> null
	}

      + disk {
	  + scsi	     = false -> null
	  + volume_id = "/stor/libvirt/fake_vpc/vpc1b" -> null
	}
      + disk {
	  + scsi	     = false -> null
	  + volume_id = "/stor/libvirt/fake_vpc/vpc1b_data" -> null
	}

      + graphics {
	  + autoport	  = true -> null
	  + listen_address = "127.0.0.1" -> null
	  + listen_type	  = "address" -> null
	  + type		  = "spice" -> null
	}

      + network_interface {
	  + addresses	  = [] -> null
	  + mac		  = "52:54:00:2A:35:D3" -> null
	  + network_id	  = "66249979-1ee3-456a-9cda-b47ef6783cf9" -> null
	  + network_name	  = "vpc1b" -> null
	  + wait_for_lease = false -> null
	}
    }

  # module.vpc.libvirt_domain.vpc[2] will be destroyed
  + resource "libvirt_domain" "vpc" {
      + arch	   = "x86_64" -> null
      + autostart   = true -> null
      + cloudinit   = "/stor/libvirt/fake_vpc/vpc1c.iso;5e498c15-34b6-72dc-1d2b-aeba497ebe25" -> null
      + cmdline	   = [] -> null
      + cpu	   = {
	  + "mode" = "host-passthrough"
	} -> null
      + emulator	   = "/run/libvirt/nix-emulators/qemu-system-x86_64" -> null
      + fw_cfg_name = "opt/com.coreos/config" -> null
      + id	   = "58590f3c-9fbc-4fae-a5d4-df5a9f6e3400" -> null
      + machine	   = "pc" -> null
      + memory	   = 3096 -> null
      + name	   = "vpc1c" -> null
      + qemu_agent  = false -> null
      + running	   = true -> null
      + vcpu	   = 4 -> null

      + console {
	  + source_host	  = "127.0.0.1" -> null
	  + source_service = "0" -> null
	  + target_port	  = "0" -> null
	  + target_type	  = "serial" -> null
	  + type		  = "pty" -> null
	}
      + console {
	  + source_host	  = "127.0.0.1" -> null
	  + source_service = "0" -> null
	  + target_port	  = "1" -> null
	  + target_type	  = "virtio" -> null
	  + type		  = "pty" -> null
	}

      + disk {
	  + scsi	     = false -> null
	  + volume_id = "/stor/libvirt/fake_vpc/vpc1c" -> null
	}
      + disk {
	  + scsi	     = false -> null
	  + volume_id = "/stor/libvirt/fake_vpc/vpc1c_data" -> null
	}

      + graphics {
	  + autoport	  = true -> null
	  + listen_address = "127.0.0.1" -> null
	  + listen_type	  = "address" -> null
	  + type		  = "spice" -> null
	}

      + network_interface {
	  + addresses	  = [] -> null
	  + mac		  = "52:54:00:06:B1:E2" -> null
	  + network_id	  = "4b636f59-5eb9-49eb-ae8b-379c26d4484b" -> null
	  + network_name	  = "vpc1c" -> null
	  + wait_for_lease = false -> null
	}
    }

  # module.vpc.libvirt_volume.vpc[0] will be destroyed
  + resource "libvirt_volume" "vpc" {
      + base_volume_id = "/stor/libvirt/fake_vpc/vpc1_vpc_base" -> null
      + format	      = "qcow2" -> null
      + id	      = "/stor/libvirt/fake_vpc/vpc1a" -> null
      + name	      = "vpc1a" -> null
      + pool	      = "fake_vpc" -> null
      + size	      = 10737418240 -> null
    }

  # module.vpc.libvirt_volume.vpc[1] will be destroyed
  + resource "libvirt_volume" "vpc" {
      + base_volume_id = "/stor/libvirt/fake_vpc/vpc1_vpc_base" -> null
      + format	      = "qcow2" -> null
      + id	      = "/stor/libvirt/fake_vpc/vpc1b" -> null
      + name	      = "vpc1b" -> null
      + pool	      = "fake_vpc" -> null
      + size	      = 10737418240 -> null
    }

  # module.vpc.libvirt_volume.vpc[2] will be destroyed
  + resource "libvirt_volume" "vpc" {
      + base_volume_id = "/stor/libvirt/fake_vpc/vpc1_vpc_base" -> null
      + format	      = "qcow2" -> null
      + id	      = "/stor/libvirt/fake_vpc/vpc1c" -> null
      + name	      = "vpc1c" -> null
      + pool	      = "fake_vpc" -> null
      + size	      = 10737418240 -> null
    }

  # module.vpc.libvirt_volume.vpc_base[0] will be destroyed
  + resource "libvirt_volume" "vpc_base" {
      + format = "qcow2" -> null
      + id     = "/stor/libvirt/fake_vpc/vpc1_vpc_base" -> null
      + name   = "vpc1_vpc_base" -> null
      + pool   = "fake_vpc" -> null
      + size   = 10737418240 -> null
      + source = "../../../../../packer/vpc/.cache/output/packer-vpc.qcow2" -> null
    }

  # module.vpc.libvirt_volume.vpc_data[0] will be destroyed
  + resource "libvirt_volume" "vpc_data" {
      + format = "qcow2" -> null
      + id     = "/stor/libvirt/fake_vpc/vpc1a_data" -> null
      + name   = "vpc1a_data" -> null
      + pool   = "fake_vpc" -> null
      + size   = 128849018880 -> null
    }

  # module.vpc.libvirt_volume.vpc_data[1] will be destroyed
  + resource "libvirt_volume" "vpc_data" {
      + format = "qcow2" -> null
      + id     = "/stor/libvirt/fake_vpc/vpc1b_data" -> null
      + name   = "vpc1b_data" -> null
      + pool   = "fake_vpc" -> null
      + size   = 128849018880 -> null
    }

  # module.vpc.libvirt_volume.vpc_data[2] will be destroyed
  + resource "libvirt_volume" "vpc_data" {
      + format = "qcow2" -> null
      + id     = "/stor/libvirt/fake_vpc/vpc1c_data" -> null
      + name   = "vpc1c_data" -> null
      + pool   = "fake_vpc" -> null
      + size   = 128849018880 -> null
    }

Plan: 0 to add, 0 to change, 23 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value:
module.utl.null_resource.utl[0]: Destroying... [id=2087008199718572930]
module.utl.null_resource.utl[0]: Destruction complete after 0s
libvirt_network.vpc[0]: Destroying... [id=470120c8-2a8f-4154-87b5-19ef3e03e9a1]
libvirt_network.vpc_gw[0]: Destroying... [id=d3e1b6c4-8269-4f60-8689-91f31125c20f]
libvirt_network.vpc[2]: Destroying... [id=4b636f59-5eb9-49eb-ae8b-379c26d4484b]
libvirt_network.vpc[1]: Destroying... [id=66249979-1ee3-456a-9cda-b47ef6783cf9]
module.vpc.libvirt_domain.vpc[1]: Destroying... [id=ca78ea41-17c6-4565-9fb7-e082f74242e8]
module.vpc.libvirt_domain.vpc[2]: Destroying... [id=58590f3c-9fbc-4fae-a5d4-df5a9f6e3400]
module.utl.libvirt_domain.utl[0]: Destroying... [id=a87a4be5-b15e-4add-ba5c-f8dd0b5fc91a]
module.vpc.libvirt_domain.vpc[0]: Destroying... [id=3ad8231d-97e9-4ffa-9199-b4d63a47f927]
module.vpc.libvirt_domain.vpc[1]: Destruction complete after 1s
module.vpc.libvirt_domain.vpc[2]: Destruction complete after 1s
module.utl.libvirt_domain.utl[0]: Destruction complete after 1s
module.utl.libvirt_cloudinit_disk.utl[0]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1u.iso;5e498c15-617d-a18e-4a38-38532d29cc74]
module.utl.libvirt_volume.utl[0]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1u]
module.vpc.libvirt_domain.vpc[0]: Destruction complete after 2s
module.utl.libvirt_cloudinit_disk.utl[0]: Destruction complete after 1s
module.utl.libvirt_volume.utl[0]: Destruction complete after 1s
module.vpc.libvirt_volume.vpc_data[0]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1a_data]
module.vpc.libvirt_volume.vpc[0]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1a]
module.vpc.libvirt_volume.vpc_data[1]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1b_data]
module.vpc.libvirt_volume.vpc[2]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1c]
module.vpc.libvirt_cloudinit_disk.vpc[2]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1c.iso;5e498c15-34b6-72dc-1d2b-aeba497ebe25]
module.vpc.libvirt_cloudinit_disk.vpc[0]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1a.iso;5e498bfb-9f47-9cee-9da5-29af89d2e321]
module.vpc.libvirt_volume.vpc_data[0]: Destruction complete after 0s
module.vpc.libvirt_volume.vpc[0]: Destruction complete after 0s
module.vpc.libvirt_volume.vpc[1]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1b]
module.vpc.libvirt_volume.vpc_data[2]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1c_data]
module.vpc.libvirt_volume.vpc_data[1]: Destruction complete after 0s
module.vpc.libvirt_cloudinit_disk.vpc[1]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1b.iso;5e498bfa-edec-eeea-6c94-b8c70325f7b9]
module.vpc.libvirt_volume.vpc_data[2]: Destruction complete after 0s
module.vpc.libvirt_volume.vpc[2]: Destruction complete after 0s
module.vpc.libvirt_volume.vpc[1]: Destruction complete after 0s
module.vpc.libvirt_cloudinit_disk.vpc[2]: Destruction complete after 0s
module.vpc.libvirt_cloudinit_disk.vpc[0]: Destruction complete after 0s
module.utl.libvirt_volume.utl_base[0]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1_utl_base]
module.vpc.libvirt_cloudinit_disk.vpc[1]: Destruction complete after 0s
module.vpc.libvirt_volume.vpc_base[0]: Destroying... [id=/stor/libvirt/fake_vpc/vpc1_vpc_base]
module.utl.libvirt_volume.utl_base[0]: Destruction complete after 0s
module.vpc.libvirt_volume.vpc_base[0]: Destruction complete after 0s
libvirt_pool.fake_vpc: Destroying... [id=91ea2b83-ec2f-493c-adf5-9812e5cb37f4]
libvirt_network.vpc_gw[0]: Destruction complete after 6s
libvirt_network.vpc[0]: Destruction complete after 6s
libvirt_network.vpc[2]: Destruction complete after 6s
libvirt_network.vpc[1]: Destruction complete after 6s
libvirt_pool.fake_vpc: Destruction complete after 5s

Destroy complete! Resources: 23 destroyed.
```

[//]: # ( vim:set ts=2 sw=2 et syn=markdown: )
