#!/bin/bash

set -ouex pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run with root privileges."
    exit 1
fi

tldr --update

flatpak install -y --system --noninteractive flathub org.onlyoffice.desktopeditors
flatpak install -y --system --noninteractive flathub io.github.wartybix.Constrict
flatpak install -y --system --noninteractive flathub com.github.huluti.Curtail
flatpak install -y --system --noninteractive flathub io.gitlab.adhami3310.Converter
flatpak install -y --system --noninteractive flathub org.gnome.gitlab.YaLTeR.VideoTrimmer
flatpak install -y --system --noninteractive flathub org.gnome.Boxes
flatpak install -y --system --noninteractive flathub com.github.PintaProject.Pinta

flatpak install -y --system --noninteractive flathub it.mijorus.gearlever
flatpak install -y --system --noninteractive flathub com.usebottles.bottles
flatpak install -y --system --noninteractive flathub org.vinegarhq.Sober
flatpak install -y --system --noninteractive flathub org.vinegarhq.Vinegar
flatpak install -y --system --noninteractive https://elyprismlauncher.github.io/flatpak/elyprismlauncher.flatpakref

flatpak install -y --system --noninteractive flathub org.telegram.desktop
flatpak install -y --system --noninteractive flathub chat.delta.desktop
