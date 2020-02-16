
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

[//]: # ( vim:set ts=2 sw=2 et syn=markdown: )
