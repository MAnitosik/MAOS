#!/bin/bash

set -ouex pipefail

flatpak install -y --noninteractive flathub org.desktop_plus.desktop-plus
flatpak install -y --noninteractive flathub com.jetbrains.PyCharm-Professional
flatpak install -y --noninteractive flathub org.onlyoffice.desktopeditors
flatpak install -y --noninteractive flathub com.github.PintaProject.Pinta

flatpak install -y --noninteractive flathub it.mijorus.gearlever
flatpak install -y --noninteractive flathub com.usebottles.bottles
flatpak install -y --noninteractive flathub org.vinegarhq.Sober
flatpak install -y --noninteractive flathub org.vinegarhq.Vinegar
flatpak install -y --noninteractive https://elyprismlauncher.github.io/flatpak/elyprismlauncher.flatpakref

flatpak install -y --noninteractive flathub org.telegram.desktop
flatpak install -y --noninteractive flathub org.torproject.torbrowser-launcher
