#!/bin/bash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

dnf5 -y install fuse
dnf5 -y install python3-uv
dnf5 -y install nodejs npm
dnf5 -y install rust cargo
dnf5 -y install ruby
dnf5 -y install golang
dnf5 -y install gcc clang

dnf5 -y install toolbox podman buildah flatpak rpm-ostree ostree
dnf5 -y install @cosmic-desktop-environment

dnf5 -y install dnf-plugins-core
dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 -y install brave-origin

dnf5 -y install fastfetch micro zed gh git

wget https://github.com/amnezia-vpn/amnezia-client/releases/download/5.0.3.0/AmneziaVPN_5.0.3.0_linux_x64.run
chmod +x AmneziaVPN_5.0.3.0_linux_x64.run
export HOME=/tmp/amneziavpn
mkdir -p "$HOME"
QT_QPA_PLATFORM=offscreen ./AmneziaVPN_5.0.3.0_linux_x64.run --accept-licenses --default-answer --confirm-command install
rm -rf AmneziaVPN_5.0.3.0_linux_x64.run "$HOME"
ln -sf /opt/AmneziaVPN/bin/AmneziaVPN /usr/bin/AmneziaVPN
ln -sf /opt/AmneziaVPN/bin/AmneziaVPN /usr/sbin/AmneziaVPN

dnf5 -y install v2ray-geoip v2ray-domain-list-community xray
dnf5 -y install v2raya
wget -O /usr/bin/v2raya_core https://github.com/v2rayA/v2rayA/releases/download/v2.5.9/v2raya_core_linux_x64_2.5.9
chmod +x /usr/bin/v2raya_core

dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y swap zram-generator-defaults cachyos-settings
dnf5 -y install ananicy-cpp

dnf5 -y remove firefox
dnf5 -y autoremove

systemctl enable podman
systemctl enable ananicy-cpp
systemctl enable cosmic-greeter
systemctl enable cpupower
systemctl enable v2raya
systemctl enable AmneziaVPN

# desktop plus, pycharm, obs-studio, Pinta, Onlyoffice, Telegram, torbrowser, ventoy, lact, Discord, amneziavpn, v2raya, elyprismlauncher, Sober, Vinegar, Blender, Godot
# bottles, hydra launcher, heroic games launcher, steam, Mangohud, gamescope, gear lever
# zapret, waydroid, amd
