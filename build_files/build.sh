#!/bin/bash

set -ouex pipefail

mkdir /var/opt /var/roothome

### Install packages

# Installs packages from fedora repos
dnf5 install -y \
	NetworkManager-l2tp-gnome \
	distrobox \
	wireguard-tools \
	zsh \
	papirus-icon-theme \
	snapper

dnf5 remove -y toolbox

cp /ctx/cosign.pub /etc/pki/bemain-cosign.pub
rsync -r /ctx/root_files/ /

rm -rf /var/roothome/
