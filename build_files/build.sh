#!/bin/bash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

dnf5 -y install fuse
dnf5 -y install rust cargo
dnf5 -y install golang
dnf5 -y install python3-uv
dnf5 -y install llvm

dnf5 -y install toolbox podman buildah flatpak rpm-ostree ostree
dnf5 -y install @cosmic-desktop-environment

dnf5 -y install dnf-plugins-core
dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 -y install brave-origin
dnf5 -y install fastfetch micro zed gh git

dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y swap zram-generator-defaults cachyos-settings
dnf5 -y install ananicy-cpp
dnf5 -y autoremove

systemctl enable podman
systemctl enable ananicy-cpp
systemctl enable cosmic-greeter
systemctl enable cpupower

# desktop plus, pycharm, obs-studio, Pinta, Onlyoffice, Telegram, torbrowser, ventoy, lact, Discord, amneziavpn, v2raya, elyprismlauncher, Sober, Vinegar, Blender, Godot
# bottles, hydra launcher, heroic games launcher, steam, Mangohud, gamescope, gear lever
# zapret, waydroid, amd
