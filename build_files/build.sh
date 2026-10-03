#!/bin/bash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

dnf5 install -y fuse
dnf5 install -y toolbox podman buildah flatpak rpm-ostree ostree
dnf5 install -y @cosmic-desktop-environment
dnf5 -y swap ffmpeg-free ffmpeg --allowerasing
dnf5 -y install @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
dnf5 -y install mesa-va-drivers-freeworld
dnf5 -y swap mesa-vulkan-drivers{,-freeworld}
dnf5 -y install mesa-va-drivers-freeworld.i686
dnf5 -y swap mesa-vulkan-drivers{,-freeworld}.i686

dnf5 install -y dnf-plugins-core
dnf5 -y config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
dnf5 install -y brave-origin
dnf5 install -y fastfetch micro zed gh git

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
