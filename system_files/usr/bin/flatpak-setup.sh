#!/bin/bash

set -ouex pipefail

flatpak install -y --system --noninteractive flathub org.desktop_plus.desktop-plus
flatpak install -y --system --noninteractive flathub com.jetbrains.PyCharm-Professional
flatpak install -y --system --noninteractive flathub org.onlyoffice.desktopeditors
flatpak install -y --system --noninteractive flathub com.github.PintaProject.Pinta

flatpak install -y --system --noninteractive flathub it.mijorus.gearlever
flatpak install -y --system --noninteractive flathub com.usebottles.bottles
flatpak install -y --system --noninteractive flathub org.vinegarhq.Sober
flatpak install -y --system --noninteractive flathub org.vinegarhq.Vinegar
flatpak install -y --system --noninteractive https://elyprismlauncher.github.io/flatpak/elyprismlauncher.flatpakref

flatpak install -y --system --noninteractive flathub org.telegram.desktop
flatpak install -y --system --noninteractive flathub org.torproject.torbrowser-launcher
flatpak install -y --system --noninteractive flathub chat.delta.desktop
