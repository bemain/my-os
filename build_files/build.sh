#!/bin/bash

set -ouex pipefail

mkdir /var/opt /var/roothome

# Add Mullvad VPN repo
dnf5 config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

# Install packages I want
dnf5 install -y \
	NetworkManager-l2tp-gnome \
	krb5-workstation \
	distrobox \
	wireguard-tools \
	zsh \
	papirus-icon-theme \
	btrbk \
	gparted \
	waydroid \
	mullvad-vpn

# Mullvad VPN is installed in /opt which does not persist to the final image, so we move it
mkdir -p /usr/lib/mullvad
mv "/opt/Mullvad VPN"/* /usr/lib/mullvad/

# Remove packages I don't use
dnf5 remove -y \
    toolbox \
    firefox  # Prefer the Flatpak version


cp /ctx/cosign.pub /etc/pki/bemain-cosign.pub  # Copy signing key
rsync -r /ctx/root_files/ /  # Copy root files

rm -rf /var/roothome/
