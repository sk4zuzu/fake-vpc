
```bash
$ make k8s-destroy
```
```
pipenv run sh -c "cd /home/asd/_git/fake-vpc/LIVE/k8s1/ && terragrunt destroy"
[terragrunt] 2020/02/16 20:51:51 Reading Terragrunt config file at /home/asd/_git/fake-vpc/LIVE/k8s1/terragrunt.hcl
[terragrunt] [/home/asd/_git/fake-vpc/LIVE/k8s1] 2020/02/16 20:51:51 Running command: terraform --version
[terragrunt] 2020/02/16 20:51:51 WARNING: no double-slash (//) found in source URL /home/asd/_git/fake-vpc/terraform/k8s. Relative paths in downloaded Terraform code may not work.
[terragrunt] 2020/02/16 20:51:51 Downloading Terraform configurations from file:///home/asd/_git/fake-vpc/terraform/k8s into /home/asd/_git/fake-vpc/LIVE/k8s1/.terragrunt-cache/HxjLFA5UP90vhJmv7Ci-dH28BxM/ycHU0Sf53dyP2nQy6FcuQxPAR9Y
[terragrunt] 2020/02/16 20:51:51 Copying files from /home/asd/_git/fake-vpc/LIVE/k8s1 into /home/asd/_git/fake-vpc/LIVE/k8s1/.terragrunt-cache/HxjLFA5UP90vhJmv7Ci-dH28BxM/ycHU0Sf53dyP2nQy6FcuQxPAR9Y
[terragrunt] 2020/02/16 20:51:51 Setting working directory to /home/asd/_git/fake-vpc/LIVE/k8s1/.terragrunt-cache/HxjLFA5UP90vhJmv7Ci-dH28BxM/ycHU0Sf53dyP2nQy6FcuQxPAR9Y
[terragrunt] 2020/02/16 20:51:51 Running command: terraform destroy
module.master-az3.libvirt_cloudinit_disk.master[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m3.iso;5e498d0f-70d6-c994-121b-d077c9e58678]
module.master-az3.libvirt_volume.master_base[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m3-base]
module.master-az3.libvirt_volume.master[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m3]
module.master-az3.libvirt_domain.master[0]: Refreshing state... [id=a1f906aa-abce-4cc6-84ed-89d3a00b46cf]
module.master-az2.libvirt_cloudinit_disk.master[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m2.iso;5e498d10-de6e-1502-fe14-2ccc10150c77]
module.master-az2.libvirt_volume.master_base[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m2-base]
module.master-az2.libvirt_volume.master[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m2]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Refreshing state... [id=/var/lib/libvirt/images/k1c1.iso;5e498d3e-ea16-9c08-7c38-f04d3cbcbb4c]
module.master-az1.libvirt_cloudinit_disk.master[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m1.iso;5e498d3d-4479-ffe1-cd5f-e53e0aadc497]
module.compute-az1.libvirt_volume.compute_base[0]: Refreshing state... [id=/var/lib/libvirt/images/k1c1-base]
module.master-az1.libvirt_volume.master_base[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m1-base]
module.master-az2.libvirt_domain.master[0]: Refreshing state... [id=9649d302-975d-4871-88f7-cc7cec88c1f5]
module.compute-az1.libvirt_volume.compute[0]: Refreshing state... [id=/var/lib/libvirt/images/k1c1]
module.master-az1.libvirt_volume.master[0]: Refreshing state... [id=/var/lib/libvirt/images/k1m1]
module.compute-az1.libvirt_domain.compute[0]: Refreshing state... [id=211d6081-d3ba-436d-af30-567a02db2e3b]
module.master-az1.libvirt_domain.master[0]: Refreshing state... [id=6f95aa07-4ffc-43c8-b7e3-4847e0c069cd]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + destroy

Terraform will perform the following actions:

  # module.compute-az1.libvirt_cloudinit_disk.compute[0] will be destroyed
  + resource "libvirt_cloudinit_disk" "compute" {
      + id	      = "/var/lib/libvirt/images/k1c1.iso;5e498d3e-ea16-9c08-7c38-f04d3cbcbb4c" -> null
      + meta_data      = <<~EOT
	    instance-id: "k1c1"
	    local-hostname: "k1c1"
	EOT -> null
      + name	      = "k1c1.iso" -> null
      + network_config = <<~EOT
	    version: 2
	    ethernets:
	      ens3:
		dhcp4: true
		dhcp6: false
		dhcp-identifier: mac
	EOT -> null
      + pool	      = "default" -> null
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

  # module.compute-az1.libvirt_domain.compute[0] will be destroyed
  + resource "libvirt_domain" "compute" {
      + arch	   = "x86_64" -> null
      + autostart   = false -> null
      + cloudinit   = "/var/lib/libvirt/images/k1c1.iso;5e498d3e-ea16-9c08-7c38-f04d3cbcbb4c" -> null
      + cmdline	   = [] -> null
      + emulator	   = "/usr/bin/kvm-spice" -> null
      + fw_cfg_name = "opt/com.coreos/config" -> null
      + id	   = "211d6081-d3ba-436d-af30-567a02db2e3b" -> null
      + machine	   = "ubuntu" -> null
      + memory	   = 1024 -> null
      + name	   = "k1c1" -> null
      + qemu_agent  = false -> null
      + running	   = true -> null
      + vcpu	   = 2 -> null

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
	  + volume_id = "/var/lib/libvirt/images/k1c1" -> null
	}

      + network_interface {
	  + addresses	  = [] -> null
	  + bridge	  = "vpc1a" -> null
	  + mac		  = "52:54:00:0E:28:6C" -> null
	  + wait_for_lease = false -> null
	}
    }

  # module.compute-az1.libvirt_volume.compute[0] will be destroyed
  + resource "libvirt_volume" "compute" {
      + base_volume_id = "/var/lib/libvirt/images/k1c1-base" -> null
      + format	      = "qcow2" -> null
      + id	      = "/var/lib/libvirt/images/k1c1" -> null
      + name	      = "k1c1" -> null
      + pool	      = "default" -> null
      + size	      = 17179869184 -> null
    }

  # module.compute-az1.libvirt_volume.compute_base[0] will be destroyed
  + resource "libvirt_volume" "compute_base" {
      + format = "qcow2" -> null
      + id     = "/var/lib/libvirt/images/k1c1-base" -> null
      + name   = "k1c1-base" -> null
      + pool   = "default" -> null
      + size   = 10737418240 -> null
      + source = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2" -> null
    }

  # module.master-az1.libvirt_cloudinit_disk.master[0] will be destroyed
  + resource "libvirt_cloudinit_disk" "master" {
      + id	      = "/var/lib/libvirt/images/k1m1.iso;5e498d3d-4479-ffe1-cd5f-e53e0aadc497" -> null
      + meta_data      = <<~EOT
	    instance-id: "k1m1"
	    local-hostname: "k1m1"
	EOT -> null
      + name	      = "k1m1.iso" -> null
      + network_config = <<~EOT
	    version: 2
	    ethernets:
	      ens3:
		dhcp4: true
		dhcp6: false
		dhcp-identifier: mac
	EOT -> null
      + pool	      = "default" -> null
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

  # module.master-az1.libvirt_domain.master[0] will be destroyed
  + resource "libvirt_domain" "master" {
      + arch	   = "x86_64" -> null
      + autostart   = false -> null
      + cloudinit   = "/var/lib/libvirt/images/k1m1.iso;5e498d3d-4479-ffe1-cd5f-e53e0aadc497" -> null
      + cmdline	   = [] -> null
      + emulator	   = "/usr/bin/kvm-spice" -> null
      + fw_cfg_name = "opt/com.coreos/config" -> null
      + id	   = "6f95aa07-4ffc-43c8-b7e3-4847e0c069cd" -> null
      + machine	   = "ubuntu" -> null
      + memory	   = 2048 -> null
      + name	   = "k1m1" -> null
      + qemu_agent  = false -> null
      + running	   = true -> null
      + vcpu	   = 2 -> null

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
	  + volume_id = "/var/lib/libvirt/images/k1m1" -> null
	}

      + network_interface {
	  + addresses	  = [] -> null
	  + bridge	  = "vpc1a" -> null
	  + mac		  = "52:54:00:BA:19:90" -> null
	  + wait_for_lease = false -> null
	}
    }

  # module.master-az1.libvirt_volume.master[0] will be destroyed
  + resource "libvirt_volume" "master" {
      + base_volume_id = "/var/lib/libvirt/images/k1m1-base" -> null
      + format	      = "qcow2" -> null
      + id	      = "/var/lib/libvirt/images/k1m1" -> null
      + name	      = "k1m1" -> null
      + pool	      = "default" -> null
      + size	      = 17179869184 -> null
    }

  # module.master-az1.libvirt_volume.master_base[0] will be destroyed
  + resource "libvirt_volume" "master_base" {
      + format = "qcow2" -> null
      + id     = "/var/lib/libvirt/images/k1m1-base" -> null
      + name   = "k1m1-base" -> null
      + pool   = "default" -> null
      + size   = 10737418240 -> null
      + source = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2" -> null
    }

  # module.master-az2.libvirt_cloudinit_disk.master[0] will be destroyed
  + resource "libvirt_cloudinit_disk" "master" {
      + id	      = "/var/lib/libvirt/images/k1m2.iso;5e498d10-de6e-1502-fe14-2ccc10150c77" -> null
      + meta_data      = <<~EOT
	    instance-id: "k1m2"
	    local-hostname: "k1m2"
	EOT -> null
      + name	      = "k1m2.iso" -> null
      + network_config = <<~EOT
	    version: 2
	    ethernets:
	      ens3:
		dhcp4: true
		dhcp6: false
		dhcp-identifier: mac
	EOT -> null
      + pool	      = "default" -> null
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

  # module.master-az2.libvirt_domain.master[0] will be destroyed
  + resource "libvirt_domain" "master" {
      + arch	   = "x86_64" -> null
      + autostart   = false -> null
      + cloudinit   = "/var/lib/libvirt/images/k1m2.iso;5e498d10-de6e-1502-fe14-2ccc10150c77" -> null
      + cmdline	   = [] -> null
      + emulator	   = "/usr/bin/kvm-spice" -> null
      + fw_cfg_name = "opt/com.coreos/config" -> null
      + id	   = "9649d302-975d-4871-88f7-cc7cec88c1f5" -> null
      + machine	   = "ubuntu" -> null
      + memory	   = 2048 -> null
      + name	   = "k1m2" -> null
      + qemu_agent  = false -> null
      + running	   = true -> null
      + vcpu	   = 2 -> null

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
	  + volume_id = "/var/lib/libvirt/images/k1m2" -> null
	}

      + network_interface {
	  + addresses	  = [] -> null
	  + bridge	  = "vpc1b" -> null
	  + mac		  = "52:54:00:BE:93:1D" -> null
	  + wait_for_lease = false -> null
	}
    }

  # module.master-az2.libvirt_volume.master[0] will be destroyed
  + resource "libvirt_volume" "master" {
      + base_volume_id = "/var/lib/libvirt/images/k1m2-base" -> null
      + format	      = "qcow2" -> null
      + id	      = "/var/lib/libvirt/images/k1m2" -> null
      + name	      = "k1m2" -> null
      + pool	      = "default" -> null
      + size	      = 17179869184 -> null
    }

  # module.master-az2.libvirt_volume.master_base[0] will be destroyed
  + resource "libvirt_volume" "master_base" {
      + format = "qcow2" -> null
      + id     = "/var/lib/libvirt/images/k1m2-base" -> null
      + name   = "k1m2-base" -> null
      + pool   = "default" -> null
      + size   = 10737418240 -> null
      + source = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2" -> null
    }

  # module.master-az3.libvirt_cloudinit_disk.master[0] will be destroyed
  + resource "libvirt_cloudinit_disk" "master" {
      + id	      = "/var/lib/libvirt/images/k1m3.iso;5e498d0f-70d6-c994-121b-d077c9e58678" -> null
      + meta_data      = <<~EOT
	    instance-id: "k1m3"
	    local-hostname: "k1m3"
	EOT -> null
      + name	      = "k1m3.iso" -> null
      + network_config = <<~EOT
	    version: 2
	    ethernets:
	      ens3:
		dhcp4: true
		dhcp6: false
		dhcp-identifier: mac
	EOT -> null
      + pool	      = "default" -> null
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

  # module.master-az3.libvirt_domain.master[0] will be destroyed
  + resource "libvirt_domain" "master" {
      + arch	   = "x86_64" -> null
      + autostart   = false -> null
      + cloudinit   = "/var/lib/libvirt/images/k1m3.iso;5e498d0f-70d6-c994-121b-d077c9e58678" -> null
      + cmdline	   = [] -> null
      + emulator	   = "/usr/bin/kvm-spice" -> null
      + fw_cfg_name = "opt/com.coreos/config" -> null
      + id	   = "a1f906aa-abce-4cc6-84ed-89d3a00b46cf" -> null
      + machine	   = "ubuntu" -> null
      + memory	   = 2048 -> null
      + name	   = "k1m3" -> null
      + qemu_agent  = false -> null
      + running	   = true -> null
      + vcpu	   = 2 -> null

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
	  + volume_id = "/var/lib/libvirt/images/k1m3" -> null
	}

      + network_interface {
	  + addresses	  = [] -> null
	  + bridge	  = "vpc1c" -> null
	  + mac		  = "52:54:00:32:74:8B" -> null
	  + wait_for_lease = false -> null
	}
    }

  # module.master-az3.libvirt_volume.master[0] will be destroyed
  + resource "libvirt_volume" "master" {
      + base_volume_id = "/var/lib/libvirt/images/k1m3-base" -> null
      + format	      = "qcow2" -> null
      + id	      = "/var/lib/libvirt/images/k1m3" -> null
      + name	      = "k1m3" -> null
      + pool	      = "default" -> null
      + size	      = 17179869184 -> null
    }

  # module.master-az3.libvirt_volume.master_base[0] will be destroyed
  + resource "libvirt_volume" "master_base" {
      + format = "qcow2" -> null
      + id     = "/var/lib/libvirt/images/k1m3-base" -> null
      + name   = "k1m3-base" -> null
      + pool   = "default" -> null
      + size   = 10737418240 -> null
      + source = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2" -> null
    }

Plan: 0 to add, 0 to change, 16 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value:
module.master-az1.libvirt_domain.master[0]: Destroying... [id=6f95aa07-4ffc-43c8-b7e3-4847e0c069cd]
module.compute-az1.libvirt_domain.compute[0]: Destroying... [id=211d6081-d3ba-436d-af30-567a02db2e3b]
module.master-az2.libvirt_domain.master[0]: Destroying... [id=9649d302-975d-4871-88f7-cc7cec88c1f5]
module.master-az3.libvirt_domain.master[0]: Destroying... [id=a1f906aa-abce-4cc6-84ed-89d3a00b46cf]
module.master-az3.libvirt_domain.master[0]: Destruction complete after 0s
module.master-az2.libvirt_domain.master[0]: Destruction complete after 0s
module.master-az2.libvirt_cloudinit_disk.master[0]: Destroying... [id=/var/lib/libvirt/images/k1m2.iso;5e498d10-de6e-1502-fe14-2ccc10150c77]
module.master-az2.libvirt_volume.master[0]: Destroying... [id=/var/lib/libvirt/images/k1m2]
module.master-az3.libvirt_volume.master[0]: Destroying... [id=/var/lib/libvirt/images/k1m3]
module.master-az3.libvirt_cloudinit_disk.master[0]: Destroying... [id=/var/lib/libvirt/images/k1m3.iso;5e498d0f-70d6-c994-121b-d077c9e58678]
module.master-az3.libvirt_cloudinit_disk.master[0]: Destruction complete after 0s
module.master-az2.libvirt_volume.master[0]: Destruction complete after 0s
module.master-az2.libvirt_cloudinit_disk.master[0]: Destruction complete after 0s
module.master-az3.libvirt_volume.master[0]: Destruction complete after 0s
module.master-az2.libvirt_volume.master_base[0]: Destroying... [id=/var/lib/libvirt/images/k1m2-base]
module.master-az3.libvirt_volume.master_base[0]: Destroying... [id=/var/lib/libvirt/images/k1m3-base]
module.master-az2.libvirt_volume.master_base[0]: Destruction complete after 0s
module.master-az3.libvirt_volume.master_base[0]: Destruction complete after 0s
module.compute-az1.libvirt_domain.compute[0]: Destruction complete after 1s
module.master-az1.libvirt_domain.master[0]: Destruction complete after 1s
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Destroying... [id=/var/lib/libvirt/images/k1c1.iso;5e498d3e-ea16-9c08-7c38-f04d3cbcbb4c]
module.master-az1.libvirt_cloudinit_disk.master[0]: Destroying... [id=/var/lib/libvirt/images/k1m1.iso;5e498d3d-4479-ffe1-cd5f-e53e0aadc497]
module.compute-az1.libvirt_volume.compute[0]: Destroying... [id=/var/lib/libvirt/images/k1c1]
module.master-az1.libvirt_volume.master[0]: Destroying... [id=/var/lib/libvirt/images/k1m1]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Destruction complete after 0s
module.compute-az1.libvirt_volume.compute[0]: Destruction complete after 0s
module.master-az1.libvirt_cloudinit_disk.master[0]: Destruction complete after 0s
module.master-az1.libvirt_volume.master[0]: Destruction complete after 0s
module.compute-az1.libvirt_volume.compute_base[0]: Destroying... [id=/var/lib/libvirt/images/k1c1-base]
module.master-az1.libvirt_volume.master_base[0]: Destroying... [id=/var/lib/libvirt/images/k1m1-base]
module.compute-az1.libvirt_volume.compute_base[0]: Destruction complete after 0s
module.master-az1.libvirt_volume.master_base[0]: Destruction complete after 0s

Destroy complete! Resources: 16 destroyed.
```

[//]: # ( vim:set ts=2 sw=2 et syn=markdown: )
