#!/bin/bash

set -ouex pipefail

mkdir /var/roothome

# Add Mullvad VPN repo
dnf5 config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# Install packages I want
dnf5 install -y \
	NetworkManager-l2tp-gnome \
	btrbk \
	distrobox \
	fwupd \
	gparted \
	krb5-workstation \
	mullvad-vpn \
	papirus-icon-theme \
	rclone \
	waydroid \
	wireguard-tools \
	yq \
	zsh

# Remove packages I don't use
dnf5 remove -y \
	firefox \
    toolbox


cp /ctx/cosign.pub /etc/pki/bemain-cosign.pub  # Copy signing key

# Copied after package installs so packages cannot overwrite these files
cp -avf "/ctx/system_files"/. /

rm -rf /var/roothome/
