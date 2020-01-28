
SELF := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

export

.PHONY: all requirements

all: vpc-apply

requirements: binaries extras python

.PHONY: binaries extras python

binaries:
	make -f $(SELF)/Makefile.BINARIES

extras:
	make -f $(SELF)/Makefile.EXTRAS

python:
	make -f $(SELF)/Makefile.PYTHON

.PHONY: utl-disk vpc-disk

utl-disk:
	cd $(SELF)/packer/utl/ && make build

vpc-disk:
	cd $(SELF)/packer/vpc/ && make build

.PHONY: vpc-apply vpc-destroy ssh-utl

vpc-apply: utl-disk vpc-disk
	pipenv run sh -c "cd $(SELF)/LIVE/vpc1/ && terragrunt apply"

vpc-destroy:
	pipenv run sh -c "cd $(SELF)/LIVE/vpc1/ && terragrunt destroy"

ssh-utl:
	@ssh -o ForwardAgent=yes \
	     -o StrictHostKeyChecking=no \
	     -o GlobalKnownHostsFile=/dev/null -o UserKnownHostsFile=/dev/null \
	     ubuntu@10.69.0.10

.PHONY: k8s-disk

k8s-disk:
	cd $(SELF)/packer/k8s/ && make build

.PHONY: k8s-apply k8s-destroy

k8s-apply: k8s-disk
	pipenv run sh -c "cd $(SELF)/LIVE/k8s1/ && terragrunt apply"

k8s-destroy:
	pipenv run sh -c "cd $(SELF)/LIVE/k8s1/ && terragrunt destroy"

.PHONY: clean

clean:
	-make clean -f $(SELF)/Makefile.BINARIES
	-make clean -f $(SELF)/Makefile.EXTRAS
	-make clean -f $(SELF)/Makefile.PYTHON
	-cd $(SELF)/packer/utl/ && make clean
	-cd $(SELF)/packer/vpc/ && make clean
	-cd $(SELF)/packer/k8s/ && make clean

# vim:ts=4:sw=4:noet:syn=make:
