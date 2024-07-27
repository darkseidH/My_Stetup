#!/bin/bash

# List of Flatpak applications
flatpak_apps=(
    io.gitlab.idevecore.Pomodoro
    md.obsidian.Obsidian
    org.libreoffice.LibreOffice
    org.onlyoffice.desktopeditors
    org.signal.Signal
    com.discordapp.Discord
    org.telegram.desktop
    com.usebottles.bottles
    com.github.tchx84.Flatseal
    com.obsproject.Studio
    org.qbittorrent.qBittorrent
    org.localsend.localsend_app
)

# Loop through each application and install it using Flatpak
for app in "${flatpak_apps[@]}"
do
    echo "Installing $app..."
    flatpak install --noninteractive --assumeyes flathub "$app"
    if [ $? -ne 0 ]; then
        echo "Failed to install $app"
    else
        echo "$app installed successfully"
    fi
done

