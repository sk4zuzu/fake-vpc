{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation {
  name = "fake-vpc-env";
  buildInputs = [
    git rsync
    libvirt libxslt
    pkgconfig gnumake
    go gcc
    openssl libffi
    python3 pipenv
    cdrkit cloud-utils
  ];
}

# vim:ts=2:sw=2:et:syn=nix:
