
CLOUD-LIKE VPC ENVIRONMENT DONE IN LIBVIRT / QEMU ON LINUX
==========================================================

## 1. PURPOSE

Use local resources (cpu, memory and disk storage) for creating VPC-like fully-automated environment for research and development.

## 2. ARCHITECTURE

![fake-vpc's architecture](docs/svg/architecture.svg)

## 3. REQUIREMENTS

### 3.1 SOFTWARE

__System packages__:
- cdrkit (for mkisofs)
- cloud-utils (for preparing VM initialization media)
- gcc
- git
- gnumake
- go (for building extra terraform providers)
- libffi (devel)
- libvirt (devel)
- libxslt (devel)
- openssl (devel)
- pipenv
- pkgconfig
- python3
- rsync (needed by ansible)

__Base software__:
- [packer (Hashicorp)](https://releases.hashicorp.com/packer/)
- [terraform (Hashicorp)](https://releases.hashicorp.com/terraform/)
- [terragrunt (Github)](https://github.com/gruntwork-io/terragrunt/releases)

__Terraform providers__:
- [terraform-provider-external (Hashicorp)](https://releases.hashicorp.com/terraform-provider-external/)
- [terraform-provider-libvirt (Github)](https://github.com/dmacvicar/terraform-provider-libvirt/releases)
- [terraform-provider-local (Hashicorp)](https://releases.hashicorp.com/terraform-provider-local/)
- [terraform-provider-null (Hashicorp)](https://releases.hashicorp.com/terraform-provider-null/)
- [terraform-provider-template (Hashicorp)](https://releases.hashicorp.com/terraform-provider-template/)

__Python packages__:
- ansible
- ipaddress
- pyyaml
- terraform\_external\_data

### 3.2 INCLUDED AUTOMATION

If you're using [NixOS](https://nixos.org/) you can just enter Nix shell and continue from there:
```bash
$ nix-shell
```

Otherwise just install prerequisites listed above [3.1](#31-software) as you would normally do in your Linux distro.

All the "Hashicorp" providers can be installed manually or by `terraform` itself. The "libvirt" provider has to be built from source.

For your convenience we've included `makefile` scripts that can install and build all the requirements. If you've decided to go with the "makefile" way,
just make sure that your `$GOPATH` and `$PATH` variables point to existing directories beforehand:

```bash
$ cat ~/.profile
```
```bash
...
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
...
```

To install requirements  run:

```bash
$ make requirements _GOPATH_=~/go
```
```
make -f /home/asd/_git/fake-vpc/Makefile.BINARIES
make[1]: Entering directory '/home/asd/_git/fake-vpc'
install -d /tmp/packer-1.5.1/ && curl -fSL https://releases.hashicorp.com/packer/1.5.1/packer_1.5.1_linux_amd64.zip -o /tmp/packer-1.5.1/download.zip && unzip -o -d /tmp/packer-1.5.1/ /tmp/packer-1.5.1/download.zip && mv /tmp/packer-1.5.1/packer* /home/asd/go/bin/packer-1.5.1 && rm -rf /tmp/packer-1.5.1/ && chmod +x /home/asd/go/bin/packer-1.5.1
  % Total    % Received % Xferd	 Average Speed	 Time	 Time	  Time	Current
				 Dload	Upload	 Total	 Spent	  Left	Speed

  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
  0 44.9M    0 87950	0     0	  251k	    0  0:03:03 --:--:--	 0:03:03  250k
  5 44.9M    5 2636k	0     0	 1964k	    0  0:00:23	0:00:01	 0:00:22 1962k
 10 44.9M   10 5068k	0     0	 2165k	    0  0:00:21	0:00:02	 0:00:19 2164k
 16 44.9M   16 7500k	0     0	 2244k	    0  0:00:20	0:00:03	 0:00:17 2243k
 21 44.9M   21 9948k	0     0	 2291k	    0  0:00:20	0:00:04	 0:00:16 2290k
 26 44.9M   26 12.0M	0     0	 2317k	    0  0:00:19	0:00:05	 0:00:14 2458k
 32 44.9M   32 14.4M	0     0	 2335k	    0  0:00:19	0:00:06	 0:00:13 2435k
 37 44.9M   37 16.8M	0     0	 2348k	    0  0:00:19	0:00:07	 0:00:12 2435k
 42 44.9M   42 19.2M	0     0	 2357k	    0  0:00:19	0:00:08	 0:00:11 2433k
 47 44.9M   47 21.5M	0     0	 2366k	    0  0:00:19	0:00:09	 0:00:10 2432k
 53 44.9M   53 24.1M	0     0	 2373k	    0  0:00:19	0:00:10	 0:00:09 2433k
 58 44.9M   58 26.3M	0     0	 2379k	    0  0:00:19	0:00:11	 0:00:08 2435k
 63 44.9M   63 28.7M	0     0	 2384k	    0  0:00:19	0:00:12	 0:00:07 2436k
 69 44.9M   69 31.1M	0     0	 2387k	    0  0:00:19	0:00:13	 0:00:06 2436k
 74 44.9M   74 33.4M	0     0	 2390k	    0  0:00:19	0:00:14	 0:00:05 2436k
 79 44.9M   79 35.8M	0     0	 2394k	    0  0:00:19	0:00:15	 0:00:04 2436k
 84 44.9M   84 38.2M	0     0	 2396k	    0  0:00:19	0:00:16	 0:00:03 2435k
 90 44.9M   90 40.6M	0     0	 2398k	    0  0:00:19	0:00:17	 0:00:02 2433k
 95 44.9M   95 42.9M	0     0	 2400k	    0  0:00:19	0:00:18	 0:00:01 2434k
100 44.9M  100 44.9M	0     0	 2402k	    0  0:00:19	0:00:19 --:--:-- 2436k
Archive:  /tmp/packer-1.5.1/download.zip
  inflating: /tmp/packer-1.5.1/packer
rm -f /home/asd/go/bin/packer && ln -s /home/asd/go/bin/packer-1.5.1 /home/asd/go/bin/packer
install -d /tmp/terraform-0.12.19/ && curl -fSL https://releases.hashicorp.com/terraform/0.12.19/terraform_0.12.19_linux_amd64.zip -o /tmp/terraform-0.12.19/download.zip && unzip -o -d /tmp/terraform-0.12.19/ /tmp/terraform-0.12.19/download.zip && mv /tmp/terraform-0.12.19/terraform* /home/asd/go/bin/terraform-0.12.19 && rm -rf /tmp/terraform-0.12.19/ && chmod +x /home/asd/go/bin/terraform-0.12.19
  % Total    % Received % Xferd	 Average Speed	 Time	 Time	  Time	Current
				 Dload	Upload	 Total	 Spent	  Left	Speed

  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
  9 15.7M    9 1563k	0     0	 1718k	    0  0:00:09 --:--:--	 0:00:09 1716k
 24 15.7M   24 3883k	0     0	 1784k	    0  0:00:09	0:00:02	 0:00:07 1784k
 39 15.7M   39 6379k	0     0	 2192k	    0  0:00:07	0:00:02	 0:00:05 2191k
 54 15.7M   54 8811k	0     0	 2252k	    0  0:00:07	0:00:03	 0:00:04 2251k
 69 15.7M   69 10.9M	0     0	 2289k	    0  0:00:07	0:00:04	 0:00:03 2289k
 84 15.7M   84 13.3M	0     0	 2314k	    0  0:00:06	0:00:05	 0:00:01 2422k
 99 15.7M   99 15.7M	0     0	 2333k	    0  0:00:06	0:00:06 --:--:-- 2585k
100 15.7M  100 15.7M	0     0	 2331k	    0  0:00:06	0:00:06 --:--:-- 2432k
Archive:  /tmp/terraform-0.12.19/download.zip
  inflating: /tmp/terraform-0.12.19/terraform
rm -f /home/asd/go/bin/terraform && ln -s /home/asd/go/bin/terraform-0.12.19 /home/asd/go/bin/terraform
install -d /tmp/terraform-provider-external-1.2.0/ && curl -fSL https://releases.hashicorp.com/terraform-provider-external/1.2.0/terraform-provider-external_1.2.0_linux_amd64.zip -o /tmp/terraform-provider-external-1.2.0/download.zip && unzip -o -d /tmp/terraform-provider-external-1.2.0/ /tmp/terraform-provider-external-1.2.0/download.zip && mv /tmp/terraform-provider-external-1.2.0/terraform-provider-external* /home/asd/go/bin/terraform-provider-external-1.2.0 && rm -rf /tmp/terraform-provider-external-1.2.0/ && chmod +x /home/asd/go/bin/terraform-provider-external-1.2.0
  % Total    % Received % Xferd	 Average Speed	 Time	 Time	  Time	Current
				 Dload	Upload	 Total	 Spent	  Left	Speed

  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
  8 6564k    8	530k	0     0	 1203k	    0  0:00:05 --:--:--	 0:00:05 1201k
 37 6564k   37 2466k	0     0	 1713k	    0  0:00:03	0:00:01	 0:00:02 1711k
 74 6564k   74 4882k	0     0	 2001k	    0  0:00:03	0:00:02	 0:00:01 2000k
100 6564k  100 6564k	0     0	 2096k	    0  0:00:03	0:00:03 --:--:-- 2096k
Archive:  /tmp/terraform-provider-external-1.2.0/download.zip
  inflating: /tmp/terraform-provider-external-1.2.0/terraform-provider-external_v1.2.0_x4
rm -f /home/asd/go/bin/terraform-provider-external && ln -s /home/asd/go/bin/terraform-provider-external-1.2.0 /home/asd/go/bin/terraform-provider-external
install -d /tmp/terraform-provider-local-1.4.0/ && curl -fSL https://releases.hashicorp.com/terraform-provider-local/1.4.0/terraform-provider-local_1.4.0_linux_amd64.zip -o /tmp/terraform-provider-local-1.4.0/download.zip && unzip -o -d /tmp/terraform-provider-local-1.4.0/ /tmp/terraform-provider-local-1.4.0/download.zip && mv /tmp/terraform-provider-local-1.4.0/terraform-provider-local* /home/asd/go/bin/terraform-provider-local-1.4.0 && rm -rf /tmp/terraform-provider-local-1.4.0/ && chmod +x /home/asd/go/bin/terraform-provider-local-1.4.0
  % Total    % Received % Xferd	 Average Speed	 Time	 Time	  Time	Current
				 Dload	Upload	 Total	 Spent	  Left	Speed

  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
 28 7047k   28 2042k	0     0	 1889k	    0  0:00:03	0:00:01	 0:00:02 1887k
 63 7047k   63 4474k	0     0	 2151k	    0  0:00:03	0:00:02	 0:00:01 2150k
 98 7047k   98 6922k	0     0	 2247k	    0  0:00:03	0:00:03 --:--:-- 2246k
100 7047k  100 7047k	0     0	 2247k	    0  0:00:03	0:00:03 --:--:-- 2246k
Archive:  /tmp/terraform-provider-local-1.4.0/download.zip
  inflating: /tmp/terraform-provider-local-1.4.0/terraform-provider-local_v1.4.0_x4
rm -f /home/asd/go/bin/terraform-provider-local && ln -s /home/asd/go/bin/terraform-provider-local-1.4.0 /home/asd/go/bin/terraform-provider-local
install -d /tmp/terraform-provider-null-2.1.2/ && curl -fSL https://releases.hashicorp.com/terraform-provider-null/2.1.2/terraform-provider-null_2.1.2_linux_amd64.zip -o /tmp/terraform-provider-null-2.1.2/download.zip && unzip -o -d /tmp/terraform-provider-null-2.1.2/ /tmp/terraform-provider-null-2.1.2/download.zip && mv /tmp/terraform-provider-null-2.1.2/terraform-provider-null* /home/asd/go/bin/terraform-provider-null-2.1.2 && rm -rf /tmp/terraform-provider-null-2.1.2/ && chmod +x /home/asd/go/bin/terraform-provider-null-2.1.2
  % Total    % Received % Xferd	 Average Speed	 Time	 Time	  Time	Current
				 Dload	Upload	 Total	 Spent	  Left	Speed

  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
 20 6562k   20 1328k	0     0	 1753k	    0  0:00:03 --:--:--	 0:00:03 1750k
 54 6562k   54 3584k	0     0	 2128k	    0  0:00:03	0:00:01	 0:00:02 2127k
 91 6562k   91 6016k	0     0	 2241k	    0  0:00:02	0:00:02 --:--:-- 2240k
100 6562k  100 6562k	0     0	 2256k	    0  0:00:02	0:00:02 --:--:-- 2255k
Archive:  /tmp/terraform-provider-null-2.1.2/download.zip
  inflating: /tmp/terraform-provider-null-2.1.2/terraform-provider-null_v2.1.2_x4
rm -f /home/asd/go/bin/terraform-provider-null && ln -s /home/asd/go/bin/terraform-provider-null-2.1.2 /home/asd/go/bin/terraform-provider-null
install -d /tmp/terraform-provider-template-2.1.2/ && curl -fSL https://releases.hashicorp.com/terraform-provider-template/2.1.2/terraform-provider-template_2.1.2_linux_amd64.zip -o /tmp/terraform-provider-template-2.1.2/download.zip && unzip -o -d /tmp/terraform-provider-template-2.1.2/ /tmp/terraform-provider-template-2.1.2/download.zip && mv /tmp/terraform-provider-template-2.1.2/terraform-provider-template* /home/asd/go/bin/terraform-provider-template-2.1.2 && rm -rf /tmp/terraform-provider-template-2.1.2/ && chmod +x /home/asd/go/bin/terraform-provider-template-2.1.2
  % Total    % Received % Xferd	 Average Speed	 Time	 Time	  Time	Current
				 Dload	Upload	 Total	 Spent	  Left	Speed

  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
  9 6691k    9	661k	0     0	 1292k	    0  0:00:05 --:--:--	 0:00:05 1290k
 46 6691k   46 3093k	0     0	 2045k	    0  0:00:03	0:00:01	 0:00:02 2044k
 82 6691k   82 5541k	0     0	 2201k	    0  0:00:03	0:00:02	 0:00:01 2200k
100 6691k  100 6691k	0     0	 2240k	    0  0:00:02	0:00:02 --:--:-- 2239k
Archive:  /tmp/terraform-provider-template-2.1.2/download.zip
  inflating: /tmp/terraform-provider-template-2.1.2/terraform-provider-template_v2.1.2_x4
rm -f /home/asd/go/bin/terraform-provider-template && ln -s /home/asd/go/bin/terraform-provider-template-2.1.2 /home/asd/go/bin/terraform-provider-template
curl -fSL https://github.com/gruntwork-io/terragrunt/releases/download/v0.21.11/terragrunt_linux_amd64 -o /home/asd/go/bin/terragrunt-0.21.11 && chmod +x /home/asd/go/bin/terragrunt-0.21.11
  % Total    % Received % Xferd	 Average Speed	 Time	 Time	  Time	Current
				 Dload	Upload	 Total	 Spent	  Left	Speed

  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
  0	0    0	   0	0     0	     0	    0 --:--:-- --:--:-- --:--:--     0
100   612  100	 612	0     0	  1416	    0 --:--:-- --:--:-- --:--:--  1413

  0 27.7M    0	   0	0     0	     0	    0 --:--:--	0:00:01 --:--:--     0
  1 27.7M    1	509k	0     0	  216k	    0  0:02:11	0:00:02	 0:02:09  510k
  3 27.7M    3 1087k	0     0	  317k	    0  0:01:29	0:00:03	 0:01:26  524k
  5 27.7M    5 1478k	0     0	  345k	    0  0:01:22	0:00:04	 0:01:18  505k
  7 27.7M    7 2056k	0     0	  384k	    0  0:01:13	0:00:05	 0:01:08  515k
  9 27.7M    9 2634k	0     0	  419k	    0  0:01:07	0:00:06	 0:01:01  534k
 11 27.7M   11 3212k	0     0	  440k	    0  0:01:04	0:00:07	 0:00:57  546k
 12 27.7M   12 3603k	0     0	  435k	    0  0:01:05	0:00:08	 0:00:57  518k
 14 27.7M   14 4028k	0     0	  434k	    0  0:01:05	0:00:09	 0:00:56  509k
 16 27.7M   16 4571k	0     0	  444k	    0  0:01:03	0:00:10	 0:00:53  509k
 18 27.7M   18 5354k	0     0	  470k	    0  0:01:00	0:00:11	 0:00:49  533k
 21 27.7M   21 6102k	0     0	  497k	    0  0:00:57	0:00:12	 0:00:45  579k
 23 27.7M   23 6646k	0     0	  500k	    0  0:00:56	0:00:13	 0:00:43  606k
 26 27.7M   26 7496k	0     0	  525k	    0  0:00:54	0:00:14	 0:00:40  693k
 29 27.7M   29 8447k	0     0	  552k	    0  0:00:51	0:00:15	 0:00:36  774k
 32 27.7M   32 9383k	0     0	  576k	    0  0:00:49	0:00:16	 0:00:33  821k
 36 27.7M   36 10.0M	0     0	  594k	    0  0:00:47	0:00:17	 0:00:30  832k
 39 27.7M   39 10.9M	0     0	  613k	    0  0:00:46	0:00:18	 0:00:28  913k
 41 27.7M   41 11.5M	0     0	  612k	    0  0:00:46	0:00:19	 0:00:27  860k
 45 27.7M   45 12.7M	0     0	  643k	    0  0:00:44	0:00:20	 0:00:24  922k
 51 27.7M   51 14.2M	0     0	  683k	    0  0:00:41	0:00:21	 0:00:20 1033k
 56 27.7M   56 15.8M	0     0	  727k	    0  0:00:39	0:00:22	 0:00:17 1190k
 65 27.7M   65 18.1M	0     0	  799k	    0  0:00:35	0:00:23	 0:00:12 1488k
 74 27.7M   74 20.5M	0     0	  868k	    0  0:00:32	0:00:24	 0:00:08 1854k
 82 27.7M   82 22.9M	0     0	  930k	    0  0:00:30	0:00:25	 0:00:05 2094k
 91 27.7M   91 25.3M	0     0	  988k	    0  0:00:28	0:00:26	 0:00:02 2291k
 99 27.7M   99 27.7M	0     0	 1041k	    0  0:00:27	0:00:27 --:--:-- 2437k
100 27.7M  100 27.7M	0     0	 1041k	    0  0:00:27	0:00:27 --:--:-- 2430k
rm -f /home/asd/go/bin/terragrunt && ln -s /home/asd/go/bin/terragrunt-0.21.11 /home/asd/go/bin/terragrunt
make[1]: Leaving directory '/home/asd/_git/fake-vpc'
make -f /home/asd/_git/fake-vpc/Makefile.EXTRAS
make[1]: Entering directory '/home/asd/_git/fake-vpc'
install -d /home/asd/go/src/github.com/dmacvicar/terraform-provider-libvirt/ && cd /home/asd/go/src/github.com/dmacvicar/terraform-provider-libvirt/ && git clone --branch=v0.6.1 https://github.com/dmacvicar/terraform-provider-libvirt.git . || ( git fetch origin v0.6.1 && git checkout v0.6.1 && git clean -df && git reset --hard v0.6.1 )
Cloning into '.'...
Note: switching to 'db13b678ab16fe9dca024c3daea6e56fb4cc4ae2'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

cd /home/asd/go/src/github.com/dmacvicar/terraform-provider-libvirt/ && GOPATH=/home/asd/go go build -o /home/asd/go/bin/terraform-provider-libvirt-0.6.1
rm -f /home/asd/go/bin/terraform-provider-libvirt && ln -s /home/asd/go/bin/terraform-provider-libvirt-0.6.1 /home/asd/go/bin/terraform-provider-libvirt
make[1]: Leaving directory '/home/asd/_git/fake-vpc'
make -f /home/asd/_git/fake-vpc/Makefile.PYTHON
make[1]: Entering directory '/home/asd/_git/fake-vpc'
unset SOURCE_DATE_EPOCH && pipenv --clear install --three --dev
Creating a virtualenv for this project…
Pipfile: /home/asd/_git/fake-vpc/Pipfile
Using /home/asd/3.7/bin/python (3.7.5) to create virtualenv…

⠋ Creating virtual environment...
⠙ Creating virtual environment...
⠹ Creating virtual environment...
⠸ Creating virtual environment...
⠼ Creating virtual environment...
⠴ Creating virtual environment...
⠦ Creating virtual environment...
⠧ Creating virtual environment...
⠇ Creating virtual environment...
⠏ Creating virtual environment...
⠋ Creating virtual environment...
⠙ Creating virtual environment...
⠹ Creating virtual environment...
⠸ Creating virtual environment...
⠼ Creating virtual environment...
⠴ Creating virtual environment...
⠦ Creating virtual environment...
⠧ Creating virtual environment...
⠇ Creating virtual environment...
⠏ Creating virtual environment...
⠋ Creating virtual environment...
⠙ Creating virtual environment...
⠹ Creating virtual environment...
⠸ Creating virtual environment...
⠼ Creating virtual environment...
⠴ Creating virtual environment...
⠦ Creating virtual environment...
⠧ Creating virtual environment...
⠇ Creating virtual environment...
⠏ Creating virtual environment...
⠋ Creating virtual environment...
⠙ Creating virtual environment...
⠹ Creating virtual environment...
⠸ Creating virtual environment...
⠼ Creating virtual environment...
⠴ Creating virtual environment...
⠦ Creating virtual environment...
⠧ Creating virtual environment...
⠇ Creating virtual environment...
⠏ Creating virtual environment...
⠋ Creating virtual environment...
⠙ Creating virtual environment...
⠹ Creating virtual environment...
⠸ Creating virtual environment...
⠼ Creating virtual environment...
⠴ Creating virtual environment...
⠦ Creating virtual environment...
⠧ Creating virtual environment...
⠇ Creating virtual environment...
⠏ Creating virtual environment...
⠋ Creating virtual environment...
⠙ Creating virtual environment...
⠹ Creating virtual environment...
⠸ Creating virtual environment...
⠼ Creating virtual environment...
⠴ Creating virtual environment...
⠦ Creating virtual environment...
⠧ Creating virtual environment...
⠇ Creating virtual environment...
⠏ Creating virtual environment...
⠋ Creating virtual environment...
⠙ Creating virtual environment...
⠹ Creating virtual environment...
⠸ Creating virtual environment...
⠼ Creating virtual environment...Using real prefix '/nix/store/k5rdcbcwwpvj7l9f1yvd5mfggcfz16kk-python3-3.7.5'
New python executable in /home/asd/_git/fake-vpc/.venv/bin/python
Installing setuptools, pip, wheel...
done.
Running virtualenv with interpreter /home/asd/3.7/bin/python

✔ Successfully created virtual environment!
Virtualenv location: /home/asd/_git/fake-vpc/.venv
Installing dependencies from Pipfile.lock (aa5a63)…
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.
echo PYTHONPATH = $PYTHONPATH
PYTHONPATH = .venv/lib/python3.7/site-packages::/nix/store/k5rdcbcwwpvj7l9f1yvd5mfggcfz16kk-python3-3.7.5/lib/python3.7/site-packages:/nix/store/cwm0jm24l86wc6769ivlwqbr6rynxb91-pipenv-2018.11.26/lib/python3.7/site-packages:/nix/store/jc7ilfiyw2nwj5c7cs5zrd7rms3r8yl1-python3.7-certifi-2019.6.16/lib/python3.7/site-packages:/nix/store/r86byfrxrqfnm7s2dsiw0jwgy9nd668b-python3.7-setuptools-41.2.0/lib/python3.7/site-packages:/nix/store/hcdn4n9lkxpw3x5b05y5011zdfmrjvdz-python3.7-pip-19.2.3/lib/python3.7/site-packages:/nix/store/f54w71mcmal45s12v9mm2q53f18qih95-python3.7-virtualenv-16.4.3/lib/python3.7/site-packages:/nix/store/x3yihwzi0glm3ip5p4z42wwby8rc9fkf-python3.7-virtualenv-clone-0.5.3/lib/python3.7/site-packages:/nix/store/k5rdcbcwwpvj7l9f1yvd5mfggcfz16kk-python3-3.7.5/lib/python3.7/site-packages:/nix/store/cwm0jm24l86wc6769ivlwqbr6rynxb91-pipenv-2018.11.26/lib/python3.7/site-packages:/nix/store/jc7ilfiyw2nwj5c7cs5zrd7rms3r8yl1-python3.7-certifi-2019.6.16/lib/python3.7/site-packages:/nix/store/r86byfrxrqfnm7s2dsiw0jwgy9nd668b-python3.7-setuptools-41.2.0/lib/python3.7/site-packages:/nix/store/hcdn4n9lkxpw3x5b05y5011zdfmrjvdz-python3.7-pip-19.2.3/lib/python3.7/site-packages:/nix/store/f54w71mcmal45s12v9mm2q53f18qih95-python3.7-virtualenv-16.4.3/lib/python3.7/site-packages:/nix/store/x3yihwzi0glm3ip5p4z42wwby8rc9fkf-python3.7-virtualenv-clone-0.5.3/lib/python3.7/site-packages
make[1]: Leaving directory '/home/asd/_git/fake-vpc'
```

To verify golang binaries run:

```bash
$ ls -1F ~/go/bin/
```
```
packer@
packer-1.5.1*
terraform@
terraform-0.12.19*
terraform-provider-external@
terraform-provider-external-1.2.0*
terraform-provider-libvirt@
terraform-provider-libvirt-0.6.1*
terraform-provider-local@
terraform-provider-local-1.4.0*
terraform-provider-null@
terraform-provider-null-2.1.2*
terraform-provider-template@
terraform-provider-template-2.1.2*
terragrunt@
terragrunt-0.21.11*
```

To verify python packages run:

```bash
$ ls -1F .venv/lib/python3.7/site-packages/
```
```
ansible/
ansible-2.9.4.dist-info/
ansible_test/
cffi/
cffi-1.13.2.dist-info/
_cffi_backend.cpython-37m-x86_64-linux-gnu.so*
cryptography/
cryptography-2.8.dist-info/
easy_install.py
ipaddress-1.0.23.dist-info/
ipaddress.py
jinja2/
Jinja2-2.11.0.dist-info/
markupsafe/
MarkupSafe-1.1.1.dist-info/
pip/
pip-20.0.2.dist-info/
pkg_resources/
__pycache__/
pycparser/
pycparser-2.19.dist-info/
PyYAML-5.3.dist-info/
setuptools/
setuptools-45.2.0.dist-info/
six-1.14.0.dist-info/
six.py
terraform_external_data/
terraform_external_data-1.0.1.dist-info/
wheel/
wheel-0.34.2.dist-info/
yaml/
```

```bash
$ PIPENV_IGNORE_VIRTUALENVS=1 PIPENV_VENV_IN_PROJECT=1 pipenv run pip list
```
```
Package                 Version
----------------------- ----------
ansible                 2.9.4
certifi                 2019.6.16
cffi                    1.13.2
cryptography            2.8
ipaddress               1.0.23
Jinja2                  2.11.0
MarkupSafe              1.1.1
pip                     20.0.2
pipenv                  2018.11.26
pycparser               2.19
PyYAML                  5.3
setuptools              45.2.0
six                     1.14.0
terraform-external-data 1.0.1
virtualenv              16.4.3
virtualenv-clone        0.5.3
wheel                   0.34.2
```

## 4. USAGE

### 4.1 CREATE VPC ENVIRONMENT

Example config `LIVE/vpc1/terragrunt.hcl`:
```hcl
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
            vcpu    = 4
            memory  = "3096"
            storage = "128849018880"  # 120GiB
        },
        {
            name    = "vpc1b"
            vcpu    = 4
            memory  = "3096"
            storage = "128849018880"  # 120GiB
        },
        {
            name    = "vpc1c"
            vcpu    = 4
            memory  = "3096"
            storage = "128849018880"  # 120GiB
        },
    ]
}
```

To deploy "vpc1" environment run (packer images will be built automatically):
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

To list running libvirt domains:
```bash
$ sudo virsh list
```
```
 Id   Name    State
-----------------------
 5    vpc1u   running
 6    vpc1c   running
 7    vpc1b   running
 8    vpc1a   running
```

### 4.2 CREATE K8S ENVIRONMENT

Example config `LIVE/k8s1/terragrunt.hcl`:
```hcl
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
```

To deploy "k8s1" environment run (packer image will be built automatically):
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

To list running libvirt (nested) domains:
```bash
$ make ssh-utl
```
```
Warning: Permanently added '10.69.0.10' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-74-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun Feb 16 19:45:54 UTC 2020

  System load:  0.0               Users logged in:     0
  Usage of /:   14.8% of 9.52GB   IP address for ens3: 10.69.0.10
  Memory usage: 23%               IP address for ens4: 10.10.1.2
  Swap usage:   0%                IP address for ens5: 10.10.2.2
  Processes:    86                IP address for ens6: 10.10.3.2


8 packages can be updated.
8 updates are security updates.


Last login: Sun Feb 16 19:15:00 2020 from 10.69.0.1
```
```bash
ubuntu@vpc1u:~$ ssh vpc1a sudo virsh list
```
```
Warning: Permanently added 'vpc1a,10.10.1.10' (ECDSA) to the list of known hosts.
 Id    Name                           State
----------------------------------------------------
 1     k1c1                           running
 2     k1m1                           running
```
```bash
ubuntu@vpc1u:~$ ssh vpc1b sudo virsh list
```
```
Warning: Permanently added 'vpc1b,10.10.2.10' (ECDSA) to the list of known hosts.
 Id    Name                           State
----------------------------------------------------
 1     k1m2                           running
```
```bash
ubuntu@vpc1u:~$ ssh vpc1c sudo virsh list
```
```
Warning: Permanently added 'vpc1c,10.10.3.10' (ECDSA) to the list of known hosts.
 Id    Name                           State
----------------------------------------------------
 1     k1m3                           running
```

### 4.3 DEPLOY KUBERNETES (USING KUBELO)

To prepare ansible inventory run:
```bash
$ cat >kubelo/kubelo.ini <<EOF
[all:vars]
cluster_name=k1
ansible_user=ubuntu
cloud_provider=

[bastion]
vpc1u ansible_host=10.69.0.10

[etcd]
k1m1
k1m2
k1m3

[master]
k1m1
k1m2
k1m3

[compute]
k1c1
EOF
```

To deploy kubernetes:
```bash
$ (cd kubelo/ && ansible-playbook kubelo.yml)
```
```
PLAY [bastion] ********************************************************************************************************************************************************************************

TASK [bastion/openssh/configure : create local .ssh directory tree] ***************************************************************************************************************************
ok: [vpc1u -> localhost] => (item=/home/asd/_git/fake-vpc/kubelo/.ssh)
ok: [vpc1u -> localhost] => (item=/home/asd/_git/fake-vpc/kubelo/.ssh/config.d)

TASK [bastion/openssh/configure : generate bastion ssh main config] ***************************************************************************************************************************
ok: [vpc1u -> localhost]

TASK [bastion/openssh/configure : generate bastion ssh cluster config] ************************************************************************************************************************
ok: [vpc1u -> localhost]

PLAY [etcd,master,compute] ********************************************************************************************************************************************************************

TASK [python3/package/install : boostrap python3 intepreter] **********************************************************************************************************************************
skipping: [k1m3]
skipping: [k1c1]
skipping: [k1m1]
skipping: [k1m2]

TASK [python3/package/install : ensure pip packages] ******************************************************************************************************************************************
changed: [k1m2]
changed: [k1m3]
changed: [k1m1]
changed: [k1c1]

PLAY [etcd,master,compute] ********************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************
ok: [k1m2]
ok: [k1m3]
ok: [k1m1]
ok: [k1c1]

TASK [network/gather : gather etcd short hostnames] *******************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [network/gather : gather etcd fqdn addresses] ********************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [network/gather : gather etcd ipv4 addresses] ********************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [network/gather : gather master short hostnames] *****************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [network/gather : gather master fqdn addresses] ******************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [network/gather : gather master ipv4 addresses] ******************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [network/gather : gather compute short hostnames] ****************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [network/gather : gather compute fqdn addresses] *****************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [network/gather : gather compute ipv4 addresses] *****************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

PLAY [master,compute] *************************************************************************************************************************************************************************

TASK [haproxy/service/install : install haproxy] **********************************************************************************************************************************************
changed: [k1m3]
changed: [k1m2]
changed: [k1c1]
changed: [k1m1]

TASK [haproxy/service/configure : set_fact] ***************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [haproxy/service/configure : render haproxy config] **************************************************************************************************************************************
changed: [k1m2]
changed: [k1m3]
changed: [k1c1]
changed: [k1m1]

TASK [haproxy/service/configure : update /etc/hosts] ******************************************************************************************************************************************
changed: [k1m1]
changed: [k1m3]
changed: [k1c1]
changed: [k1m2]

TASK [dockerce/service/install : import docker-ce repository gpg key] *************************************************************************************************************************
ok: [k1m1]
ok: [k1c1]
ok: [k1m2]
ok: [k1m3]

TASK [dockerce/service/install : add docker-ce repository] ************************************************************************************************************************************
changed: [k1m3]
changed: [k1m2]
changed: [k1m1]
changed: [k1c1]

TASK [dockerce/service/install : set_fact] ****************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]
ok: [k1c1]

TASK [dockerce/service/install : install docker-ce] *******************************************************************************************************************************************
ok: [k1m3]
ok: [k1m2]
ok: [k1m1]
ok: [k1c1]

RUNNING HANDLER [haproxy/service/install : restart haproxy] ***********************************************************************************************************************************
changed: [k1m3]
changed: [k1m1]
changed: [k1m2]
changed: [k1c1]

PLAY [etcd] ***********************************************************************************************************************************************************************************

TASK [etcd/openssl/bootstrap : set_fact] ******************************************************************************************************************************************************
ok: [k1m1]

TASK [etcd/openssl/bootstrap : set_fact] ******************************************************************************************************************************************************
ok: [k1m1]

TASK [etcd/openssl/bootstrap : file] **********************************************************************************************************************************************************
changed: [k1m1] => (item=/etc/etcd)
changed: [k1m1] => (item=/etc/etcd/pki)
changed: [k1m1] => (item=/etc/etcd/pki/key)
changed: [k1m1] => (item=/etc/etcd/pki/csr)
changed: [k1m1] => (item=/etc/etcd/pki/crt)

TASK [etcd/openssl/bootstrap : generate etcd-ca private key] **********************************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/bootstrap : stat] **********************************************************************************************************************************************************
ok: [k1m1]

TASK [etcd/openssl/bootstrap : generate etcd-ca certificate signing request] ******************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/bootstrap : generate self-signed etcd-ca certificate] **********************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/bootstrap : generate etcd private key] *************************************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/bootstrap : stat] **********************************************************************************************************************************************************
ok: [k1m1]

TASK [etcd/openssl/bootstrap : generate etcd certificate signing request] *********************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/bootstrap : generate signed etcd certificate] ******************************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/bootstrap : generate etcd-peer private key] ********************************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/bootstrap : stat] **********************************************************************************************************************************************************
ok: [k1m1]

TASK [etcd/openssl/bootstrap : generate etcd-peer certificate signing request] ****************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/bootstrap : generate signed etcd-peer certificate] *************************************************************************************************************************
changed: [k1m1]

TASK [etcd/openssl/replicate : ensure local cache directory] **********************************************************************************************************************************
ok: [k1m1 -> localhost] => (item=absent)
ok: [k1m1 -> localhost] => (item=directory)

TASK [etcd/openssl/replicate : pull etcd pki to local cache] **********************************************************************************************************************************
ok: [k1m1]

TASK [etcd/openssl/replicate : push etcd pki from local cache] ********************************************************************************************************************************
skipping: [k1m1]
changed: [k1m2]
changed: [k1m3]

TASK [etcd/service/install : set_fact] ********************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]

TASK [etcd/service/install : download etcd binary package] ************************************************************************************************************************************
changed: [k1m1]
changed: [k1m2]
changed: [k1m3]

TASK [etcd/service/install : extract etcd binary package] *************************************************************************************************************************************
changed: [k1m1]
changed: [k1m2]
changed: [k1m3]

TASK [etcd/service/install : render etcd systemd unit] ****************************************************************************************************************************************
changed: [k1m3]
changed: [k1m2]
changed: [k1m1]

TASK [etcd/service/install : systemd daemon reload] *******************************************************************************************************************************************
ok: [k1m3]
ok: [k1m2]
ok: [k1m1]

TASK [etcd/service/configure : set_fact] ******************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]

TASK [etcd/service/configure : set_fact] ******************************************************************************************************************************************************
ok: [k1m1] => (item=['k1m1', '10.10.1.246'])
ok: [k1m1] => (item=['k1m2', '10.10.2.133'])
ok: [k1m2] => (item=['k1m1', '10.10.1.246'])
ok: [k1m1] => (item=['k1m3', '10.10.3.222'])
ok: [k1m3] => (item=['k1m1', '10.10.1.246'])
ok: [k1m2] => (item=['k1m2', '10.10.2.133'])
ok: [k1m3] => (item=['k1m2', '10.10.2.133'])
ok: [k1m2] => (item=['k1m3', '10.10.3.222'])
ok: [k1m3] => (item=['k1m3', '10.10.3.222'])

TASK [etcd/service/configure : set_fact] ******************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]

TASK [etcd/service/configure : generate etcd yaml config] *************************************************************************************************************************************
changed: [k1m3]
changed: [k1m1]
changed: [k1m2]

RUNNING HANDLER [etcd/service/install : restart etcd] *****************************************************************************************************************************************
changed: [k1m2]
changed: [k1m3]
changed: [k1m1]

PLAY [master] *********************************************************************************************************************************************************************************

TASK [master/kubeadm/install : set_fact] ******************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]

TASK [master/kubeadm/install : set_fact] ******************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]

TASK [master/kubeadm/install : import kubernetes repository gpg key] **************************************************************************************************************************
ok: [k1m3]
ok: [k1m2]
ok: [k1m1]

TASK [master/kubeadm/install : add kubernetes repository] *************************************************************************************************************************************
changed: [k1m2]
changed: [k1m1]
changed: [k1m3]

TASK [master/kubeadm/install : install binaries] **********************************************************************************************************************************************
ok: [k1m2]
ok: [k1m1]
ok: [k1m3]

TASK [master/kubeadm/install : pull docker images] ********************************************************************************************************************************************
ok: [k1m2]
ok: [k1m3]
ok: [k1m1]

TASK [master/kubeadm/configure : set_fact] ****************************************************************************************************************************************************
ok: [k1m1] => (item=k1m1.vpc1.local)
ok: [k1m1] => (item=k1m2.vpc1.local)
ok: [k1m2] => (item=k1m1.vpc1.local)
ok: [k1m1] => (item=k1m3.vpc1.local)
ok: [k1m2] => (item=k1m2.vpc1.local)
ok: [k1m3] => (item=k1m1.vpc1.local)
ok: [k1m2] => (item=k1m3.vpc1.local)
ok: [k1m3] => (item=k1m2.vpc1.local)
ok: [k1m3] => (item=k1m3.vpc1.local)

TASK [master/kubeadm/configure : set_fact] ****************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]

TASK [master/kubeadm/configure : render kubeadm config] ***************************************************************************************************************************************
changed: [k1m2]
changed: [k1m1]
changed: [k1m3]

TASK [master/kubeadm/configure : render profile config] ***************************************************************************************************************************************
changed: [k1m2]
changed: [k1m1]
changed: [k1m3]

TASK [master/kubeadm/bootstrap : stat] ********************************************************************************************************************************************************
ok: [k1m1]

TASK [master/kubeadm/bootstrap : initialize kubernetes cluster] *******************************************************************************************************************************
changed: [k1m1]

TASK [master/kubeadm/bootstrap : create compute bootstrap token] ******************************************************************************************************************************
changed: [k1m1]

TASK [master/kubeadm/bootstrap : reconstruct bootstrap hash] **********************************************************************************************************************************
changed: [k1m1]

TASK [master/kubeadm/bootstrap : stat] ********************************************************************************************************************************************************
ok: [k1m1]

TASK [master/kubeadm/bootstrap : download flannel manifest] ***********************************************************************************************************************************
changed: [k1m1]

TASK [master/kubeadm/bootstrap : deploy flannel network] **************************************************************************************************************************************
changed: [k1m1]

TASK [master/kubeadm/replicate : ensure local cache directory] ********************************************************************************************************************************
ok: [k1m1 -> localhost] => (item=absent)
ok: [k1m1 -> localhost] => (item=directory)

TASK [master/kubeadm/replicate : pull kubernetes pki to local cache] **************************************************************************************************************************
ok: [k1m1]

TASK [master/kubeadm/replicate : push kubernetes pki from local cache] ************************************************************************************************************************
changed: [k1m1]
changed: [k1m3]
changed: [k1m2]

TASK [master/kubeadm/replicate : extend kuberentes control plane] *****************************************************************************************************************************
skipping: [k1m1]
changed: [k1m3]
changed: [k1m2]

PLAY [compute] ********************************************************************************************************************************************************************************

TASK [compute/kubeadm/install : set_fact] *****************************************************************************************************************************************************
ok: [k1c1]

TASK [compute/kubeadm/install : set_fact] *****************************************************************************************************************************************************
ok: [k1c1]

TASK [compute/kubeadm/install : import kubernetes repository gpg key] *************************************************************************************************************************
ok: [k1c1]

TASK [compute/kubeadm/install : add kubernetes repository] ************************************************************************************************************************************
changed: [k1c1]

TASK [compute/kubeadm/install : install binaries] *********************************************************************************************************************************************
ok: [k1c1]

TASK [compute/kubeadm/install : pull docker images] *******************************************************************************************************************************************
ok: [k1c1]

TASK [compute/kubeadm/replicate : push token/hash from local cache] ***************************************************************************************************************************
changed: [k1c1]

TASK [compute/kubeadm/configure : lineinfile] *************************************************************************************************************************************************
skipping: [k1c1]

TASK [compute/kubeadm/configure : enable cloud provider] **************************************************************************************************************************************
skipping: [k1c1]

TASK [compute/kubeadm/configure : lineinfile] *************************************************************************************************************************************************
skipping: [k1c1]

TASK [compute/kubeadm/configure : enable node labels] *****************************************************************************************************************************************
skipping: [k1c1]

TASK [compute/kubeadm/configure : initialize compute nodes] ***********************************************************************************************************************************
changed: [k1c1]

PLAY [master] *********************************************************************************************************************************************************************************

TASK [master/helm/install : set_fact] *********************************************************************************************************************************************************
ok: [k1m1]
ok: [k1m2]
ok: [k1m3]

TASK [master/helm/install : download helm binary package] *************************************************************************************************************************************
changed: [k1m3]
changed: [k1m1]
changed: [k1m2]

TASK [master/helm/install : deploy helm] ******************************************************************************************************************************************************
changed: [k1m2]
changed: [k1m3]
changed: [k1m1]

TASK [master/helm/install : ensure /usr/local/bin/helm is executable] *************************************************************************************************************************
ok: [k1m2]
ok: [k1m3]
ok: [k1m1]

TASK [master/tiller/bootstrap : ensure service account for tiller] ****************************************************************************************************************************
changed: [k1m1]

TASK [master/tiller/bootstrap : ensure cluster role binding for tiller] ***********************************************************************************************************************
changed: [k1m1]

TASK [master/tiller/bootstrap : deploy tiller] ************************************************************************************************************************************************
changed: [k1m1]

PLAY RECAP ************************************************************************************************************************************************************************************
k1c1                       : ok=28   changed=9    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
k1m1                       : ok=74   changed=35   unreachable=0    failed=0    skipped=3    rescued=0    ignored=0
k1m2                       : ok=47   changed=19   unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
k1m3                       : ok=47   changed=19   unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
vpc1u                      : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

To list nodes and pods:
```bash
$ make ssh-utl
```
```
Warning: Permanently added '10.69.0.10' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-74-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun Feb 16 19:15:00 UTC 2020

  System load:  0.0               Users logged in:     0
  Usage of /:   14.8% of 9.52GB   IP address for ens3: 10.69.0.10
  Memory usage: 23%               IP address for ens4: 10.10.1.2
  Swap usage:   0%                IP address for ens5: 10.10.2.2
  Processes:    86                IP address for ens6: 10.10.3.2


8 packages can be updated.
8 updates are security updates.


Last login: Sun Feb 16 18:39:00 2020 from 10.69.0.1
```
```bash
ubuntu@vpc1u:~$ ssh k1m1 -t sudo -i kubectl get nodes
```
```
Warning: Permanently added 'k1m1,10.10.1.246' (ECDSA) to the list of known hosts.
NAME              STATUS   ROLES    AGE     VERSION
k1c1.vpc1.local   Ready    <none>   4m27s   v1.14.6
k1m1.vpc1.local   Ready    master   8m35s   v1.14.6
k1m2.vpc1.local   Ready    master   5m48s   v1.14.6
k1m3.vpc1.local   Ready    master   6m2s    v1.14.6
Connection to k1m1 closed.
```
```bash
ubuntu@vpc1u:~$ ssh k1m1 -t sudo -i kubectl get pods --all-namespaces
```
```
Warning: Permanently added 'k1m1,10.10.1.246' (ECDSA) to the list of known hosts.
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
kube-system   coredns-584795fc57-27x9j                  1/1     Running   0          8m10s
kube-system   coredns-584795fc57-q5bfv                  1/1     Running   0          8m11s
kube-system   kube-apiserver-k1m1.vpc1.local            1/1     Running   0          7m33s
kube-system   kube-apiserver-k1m2.vpc1.local            1/1     Running   0          5m58s
kube-system   kube-apiserver-k1m3.vpc1.local            1/1     Running   0          6m11s
kube-system   kube-controller-manager-k1m1.vpc1.local   1/1     Running   0          7m36s
kube-system   kube-controller-manager-k1m2.vpc1.local   1/1     Running   0          5m57s
kube-system   kube-controller-manager-k1m3.vpc1.local   1/1     Running   0          6m11s
kube-system   kube-flannel-ds-amd64-4xf2z               1/1     Running   0          5m59s
kube-system   kube-flannel-ds-amd64-jwpfs               1/1     Running   0          8m11s
kube-system   kube-flannel-ds-amd64-npcg4               1/1     Running   0          4m37s
kube-system   kube-flannel-ds-amd64-xlz5x               1/1     Running   0          6m11s
kube-system   kube-proxy-7pr5d                          1/1     Running   0          8m11s
kube-system   kube-proxy-gwfss                          1/1     Running   0          4m37s
kube-system   kube-proxy-hwtjz                          1/1     Running   0          5m59s
kube-system   kube-proxy-w5j59                          1/1     Running   0          6m11s
kube-system   kube-scheduler-k1m1.vpc1.local            1/1     Running   1          7m45s
kube-system   kube-scheduler-k1m2.vpc1.local            1/1     Running   0          5m57s
kube-system   kube-scheduler-k1m3.vpc1.local            1/1     Running   0          6m11s
kube-system   tiller-deploy-7b98f7c844-768jz            1/1     Running   0          3m11s
Connection to k1m1 closed.
```

### 4.4 DESTROY K8S ENVIRONMENT

To destroy "k8s1" environment (along with kubernetes):
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

### 4.5 DESTROY VPC ENVIRONMENT

To destroy "vpc1" environment:
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
