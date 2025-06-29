#!/bin/bash

set -ouex pipefail

mkdir /var/opt /var/roothome

### Install packages

# Install packages from fedora repos
dnf5 install -y \
	NetworkManager-l2tp-gnome \
	distrobox \
	wireguard-tools \
	zsh \
	papirus-icon-theme \
	snapper

# Remove packages I don't use
dnf5 remove -y \
    toolbox \
    firefox  # Prefer the Flatpak version

cp /ctx/cosign.pub /etc/pki/containers/bemain-cosign.pub
rsync -r /ctx/root_files/ /

rm -rf /var/roothome/
