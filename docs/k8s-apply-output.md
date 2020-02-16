
```bash
$ make k8s-apply
```
```
cd /home/asd/_git/fake-vpc/packer/k8s/ && make build
make[1]: Entering directory '/home/asd/_git/fake-vpc/packer/k8s'
make[1]: Nothing to be done for 'build'.
make[1]: Leaving directory '/home/asd/_git/fake-vpc/packer/k8s'
pipenv run sh -c "cd /home/asd/_git/fake-vpc/LIVE/k8s1/ && terragrunt apply"
[terragrunt] 2020/02/16 19:40:35 Reading Terragrunt config file at /home/asd/_git/fake-vpc/LIVE/k8s1/terragrunt.hcl
[terragrunt] [/home/asd/_git/fake-vpc/LIVE/k8s1] 2020/02/16 19:40:35 Running command: terraform --version
[terragrunt] 2020/02/16 19:40:35 WARNING: no double-slash (//) found in source URL /home/asd/_git/fake-vpc/terraform/k8s. Relative paths in downloaded Terraform code may not work.
[terragrunt] 2020/02/16 19:40:35 Downloading Terraform configurations from file:///home/asd/_git/fake-vpc/terraform/k8s into /home/asd/_git/fake-vpc/LIVE/k8s1/.terragrunt-cache/HxjLFA5UP90vhJmv7Ci-dH28BxM/ycHU0Sf53dyP2nQy6FcuQxPAR9Y
[terragrunt] 2020/02/16 19:40:35 Copying files from /home/asd/_git/fake-vpc/LIVE/k8s1 into /home/asd/_git/fake-vpc/LIVE/k8s1/.terragrunt-cache/HxjLFA5UP90vhJmv7Ci-dH28BxM/ycHU0Sf53dyP2nQy6FcuQxPAR9Y
[terragrunt] 2020/02/16 19:40:35 Setting working directory to /home/asd/_git/fake-vpc/LIVE/k8s1/.terragrunt-cache/HxjLFA5UP90vhJmv7Ci-dH28BxM/ycHU0Sf53dyP2nQy6FcuQxPAR9Y
[terragrunt] 2020/02/16 19:40:35 Running command: terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.compute-az1.libvirt_cloudinit_disk.compute[0] will be created
  + resource "libvirt_cloudinit_disk" "compute" {
      + id	      = (known after apply)
      + meta_data      = <<~EOT
	    instance-id: "k1c1"
	    local-hostname: "k1c1"
	EOT
      + name	      = "k1c1.iso"
      + network_config = <<~EOT
	    version: 2
	    ethernets:
	      ens3:
		dhcp4: true
		dhcp6: false
		dhcp-identifier: mac
	EOT
      + pool	      = "default"
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

  # module.compute-az1.libvirt_domain.compute[0] will be created
  + resource "libvirt_domain" "compute" {
      + arch	   = (known after apply)
      + cloudinit   = (known after apply)
      + emulator	   = (known after apply)
      + fw_cfg_name = "opt/com.coreos/config"
      + id	   = (known after apply)
      + machine	   = (known after apply)
      + memory	   = 1024
      + name	   = "k1c1"
      + qemu_agent  = false
      + running	   = true
      + vcpu	   = 2

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

      + network_interface {
	  + addresses	  = (known after apply)
	  + bridge	  = "vpc1a"
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = (known after apply)
	  + wait_for_lease = false
	}
    }

  # module.compute-az1.libvirt_volume.compute[0] will be created
  + resource "libvirt_volume" "compute" {
      + base_volume_id = (known after apply)
      + format	      = (known after apply)
      + id	      = (known after apply)
      + name	      = "k1c1"
      + pool	      = "default"
      + size	      = 17179869184
    }

  # module.compute-az1.libvirt_volume.compute_base[0] will be created
  + resource "libvirt_volume" "compute_base" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "k1c1-base"
      + pool   = "default"
      + size   = (known after apply)
      + source = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2"
    }

  # module.master-az1.libvirt_cloudinit_disk.master[0] will be created
  + resource "libvirt_cloudinit_disk" "master" {
      + id	      = (known after apply)
      + meta_data      = <<~EOT
	    instance-id: "k1m1"
	    local-hostname: "k1m1"
	EOT
      + name	      = "k1m1.iso"
      + network_config = <<~EOT
	    version: 2
	    ethernets:
	      ens3:
		dhcp4: true
		dhcp6: false
		dhcp-identifier: mac
	EOT
      + pool	      = "default"
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

  # module.master-az1.libvirt_domain.master[0] will be created
  + resource "libvirt_domain" "master" {
      + arch	   = (known after apply)
      + cloudinit   = (known after apply)
      + emulator	   = (known after apply)
      + fw_cfg_name = "opt/com.coreos/config"
      + id	   = (known after apply)
      + machine	   = (known after apply)
      + memory	   = 2048
      + name	   = "k1m1"
      + qemu_agent  = false
      + running	   = true
      + vcpu	   = 2

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

      + network_interface {
	  + addresses	  = (known after apply)
	  + bridge	  = "vpc1a"
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = (known after apply)
	  + wait_for_lease = false
	}
    }

  # module.master-az1.libvirt_volume.master[0] will be created
  + resource "libvirt_volume" "master" {
      + base_volume_id = (known after apply)
      + format	      = (known after apply)
      + id	      = (known after apply)
      + name	      = "k1m1"
      + pool	      = "default"
      + size	      = 17179869184
    }

  # module.master-az1.libvirt_volume.master_base[0] will be created
  + resource "libvirt_volume" "master_base" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "k1m1-base"
      + pool   = "default"
      + size   = (known after apply)
      + source = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2"
    }

  # module.master-az2.libvirt_cloudinit_disk.master[0] will be created
  + resource "libvirt_cloudinit_disk" "master" {
      + id	      = (known after apply)
      + meta_data      = <<~EOT
	    instance-id: "k1m2"
	    local-hostname: "k1m2"
	EOT
      + name	      = "k1m2.iso"
      + network_config = <<~EOT
	    version: 2
	    ethernets:
	      ens3:
		dhcp4: true
		dhcp6: false
		dhcp-identifier: mac
	EOT
      + pool	      = "default"
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

  # module.master-az2.libvirt_domain.master[0] will be created
  + resource "libvirt_domain" "master" {
      + arch	   = (known after apply)
      + cloudinit   = (known after apply)
      + emulator	   = (known after apply)
      + fw_cfg_name = "opt/com.coreos/config"
      + id	   = (known after apply)
      + machine	   = (known after apply)
      + memory	   = 2048
      + name	   = "k1m2"
      + qemu_agent  = false
      + running	   = true
      + vcpu	   = 2

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

      + network_interface {
	  + addresses	  = (known after apply)
	  + bridge	  = "vpc1b"
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = (known after apply)
	  + wait_for_lease = false
	}
    }

  # module.master-az2.libvirt_volume.master[0] will be created
  + resource "libvirt_volume" "master" {
      + base_volume_id = (known after apply)
      + format	      = (known after apply)
      + id	      = (known after apply)
      + name	      = "k1m2"
      + pool	      = "default"
      + size	      = 17179869184
    }

  # module.master-az2.libvirt_volume.master_base[0] will be created
  + resource "libvirt_volume" "master_base" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "k1m2-base"
      + pool   = "default"
      + size   = (known after apply)
      + source = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2"
    }

  # module.master-az3.libvirt_cloudinit_disk.master[0] will be created
  + resource "libvirt_cloudinit_disk" "master" {
      + id	      = (known after apply)
      + meta_data      = <<~EOT
	    instance-id: "k1m3"
	    local-hostname: "k1m3"
	EOT
      + name	      = "k1m3.iso"
      + network_config = <<~EOT
	    version: 2
	    ethernets:
	      ens3:
		dhcp4: true
		dhcp6: false
		dhcp-identifier: mac
	EOT
      + pool	      = "default"
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

  # module.master-az3.libvirt_domain.master[0] will be created
  + resource "libvirt_domain" "master" {
      + arch	   = (known after apply)
      + cloudinit   = (known after apply)
      + emulator	   = (known after apply)
      + fw_cfg_name = "opt/com.coreos/config"
      + id	   = (known after apply)
      + machine	   = (known after apply)
      + memory	   = 2048
      + name	   = "k1m3"
      + qemu_agent  = false
      + running	   = true
      + vcpu	   = 2

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

      + network_interface {
	  + addresses	  = (known after apply)
	  + bridge	  = "vpc1c"
	  + hostname	  = (known after apply)
	  + mac		  = (known after apply)
	  + network_id	  = (known after apply)
	  + network_name	  = (known after apply)
	  + wait_for_lease = false
	}
    }

  # module.master-az3.libvirt_volume.master[0] will be created
  + resource "libvirt_volume" "master" {
      + base_volume_id = (known after apply)
      + format	      = (known after apply)
      + id	      = (known after apply)
      + name	      = "k1m3"
      + pool	      = "default"
      + size	      = 17179869184
    }

  # module.master-az3.libvirt_volume.master_base[0] will be created
  + resource "libvirt_volume" "master_base" {
      + format = (known after apply)
      + id     = (known after apply)
      + name   = "k1m3-base"
      + pool   = "default"
      + size   = (known after apply)
      + source = "../../../../../packer/k8s/.cache/output/packer-k8s.qcow2"
    }

Plan: 16 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Creating...
module.master-az1.libvirt_cloudinit_disk.master[0]: Creating...
module.compute-az1.libvirt_volume.compute_base[0]: Creating...
module.master-az1.libvirt_volume.master_base[0]: Creating...
module.master-az2.libvirt_volume.master_base[0]: Creating...
module.master-az2.libvirt_cloudinit_disk.master[0]: Creating...
module.master-az3.libvirt_volume.master_base[0]: Creating...
module.master-az3.libvirt_cloudinit_disk.master[0]: Creating...
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [10s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [10s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [10s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [10s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [10s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [10s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [10s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [10s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [20s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [20s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [20s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [20s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [20s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [20s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [20s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [20s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [30s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [30s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [30s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [30s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [30s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [30s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [30s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [30s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [40s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [40s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [40s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [40s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [40s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [40s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [40s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [40s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [50s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [50s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [50s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [50s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [50s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [50s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [50s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [50s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [1m0s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [1m0s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [1m0s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [1m0s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [1m0s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [1m0s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [1m0s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [1m0s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [1m10s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [1m10s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [1m10s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [1m10s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [1m10s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [1m10s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [1m10s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [1m10s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [1m20s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [1m20s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [1m20s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [1m20s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [1m20s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [1m20s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [1m20s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [1m20s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [1m30s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [1m30s elapsed]
module.compute-az1.libvirt_volume.compute_base[0]: Still creating... [1m30s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [1m30s elapsed]
module.master-az2.libvirt_volume.master_base[0]: Still creating... [1m30s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [1m30s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [1m30s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Still creating... [1m30s elapsed]
module.master-az3.libvirt_volume.master_base[0]: Creation complete after 1m32s [id=/var/lib/libvirt/images/k1m3-base]
module.master-az3.libvirt_volume.master[0]: Creating...
module.master-az2.libvirt_volume.master_base[0]: Creation complete after 1m38s [id=/var/lib/libvirt/images/k1m2-base]
module.master-az2.libvirt_volume.master[0]: Creating...
module.compute-az1.libvirt_volume.compute_base[0]: Creation complete after 1m38s [id=/var/lib/libvirt/images/k1c1-base]
module.compute-az1.libvirt_volume.compute[0]: Creating...
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [1m40s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [1m40s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [1m40s elapsed]
module.master-az2.libvirt_cloudinit_disk.master[0]: Still creating... [1m40s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Still creating... [1m40s elapsed]
module.master-az3.libvirt_volume.master[0]: Still creating... [10s elapsed]
module.master-az3.libvirt_cloudinit_disk.master[0]: Creation complete after 1m43s [id=/var/lib/libvirt/images/k1m3.iso;5e498d0f-70d6-c994-121b-d077c9e58678]
module.master-az2.libvirt_cloudinit_disk.master[0]: Creation complete after 1m44s [id=/var/lib/libvirt/images/k1m2.iso;5e498d10-de6e-1502-fe14-2ccc10150c77]
module.master-az2.libvirt_volume.master[0]: Creation complete after 7s [id=/var/lib/libvirt/images/k1m2]
module.master-az2.libvirt_domain.master[0]: Creating...
module.master-az3.libvirt_volume.master[0]: Creation complete after 13s [id=/var/lib/libvirt/images/k1m3]
module.master-az3.libvirt_domain.master[0]: Creating...
module.compute-az1.libvirt_volume.compute[0]: Still creating... [10s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [1m50s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [1m50s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [1m50s elapsed]
module.master-az2.libvirt_domain.master[0]: Still creating... [10s elapsed]
module.master-az3.libvirt_domain.master[0]: Still creating... [10s elapsed]
module.compute-az1.libvirt_volume.compute[0]: Still creating... [20s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [2m0s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [2m0s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [2m0s elapsed]
module.master-az2.libvirt_domain.master[0]: Creation complete after 16s [id=9649d302-975d-4871-88f7-cc7cec88c1f5]
module.master-az3.libvirt_domain.master[0]: Creation complete after 16s [id=a1f906aa-abce-4cc6-84ed-89d3a00b46cf]
module.compute-az1.libvirt_volume.compute[0]: Still creating... [30s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [2m10s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [2m10s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [2m10s elapsed]
module.compute-az1.libvirt_volume.compute[0]: Still creating... [40s elapsed]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Still creating... [2m20s elapsed]
module.master-az1.libvirt_cloudinit_disk.master[0]: Still creating... [2m20s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Still creating... [2m20s elapsed]
module.compute-az1.libvirt_volume.compute[0]: Still creating... [50s elapsed]
module.master-az1.libvirt_volume.master_base[0]: Creation complete after 2m29s [id=/var/lib/libvirt/images/k1m1-base]
module.master-az1.libvirt_volume.master[0]: Creating...
module.master-az1.libvirt_cloudinit_disk.master[0]: Creation complete after 2m30s [id=/var/lib/libvirt/images/k1m1.iso;5e498d3d-4479-ffe1-cd5f-e53e0aadc497]
module.compute-az1.libvirt_cloudinit_disk.compute[0]: Creation complete after 2m30s [id=/var/lib/libvirt/images/k1c1.iso;5e498d3e-ea16-9c08-7c38-f04d3cbcbb4c]
module.compute-az1.libvirt_volume.compute[0]: Creation complete after 52s [id=/var/lib/libvirt/images/k1c1]
module.compute-az1.libvirt_domain.compute[0]: Creating...
module.master-az1.libvirt_volume.master[0]: Creation complete after 1s [id=/var/lib/libvirt/images/k1m1]
module.master-az1.libvirt_domain.master[0]: Creating...
module.compute-az1.libvirt_domain.compute[0]: Creation complete after 3s [id=211d6081-d3ba-436d-af30-567a02db2e3b]
module.master-az1.libvirt_domain.master[0]: Creation complete after 3s [id=6f95aa07-4ffc-43c8-b7e3-4847e0c069cd]

Apply complete! Resources: 16 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```

[//]: # ( vim:set ts=2 sw=2 et syn=markdown: )
