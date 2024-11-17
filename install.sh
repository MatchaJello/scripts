#!/bin/bash

# Error handling
# set -e  # Exit on error
# set -u  # Exit on undefined variable

# Update System
sudo dnf upgrade -y

# Install media codecs
sudo dnf group install multimedia -y

sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y

sudo dnf install lame* --exclude=lame-devel -y

sudo dnf group upgrade --with-optional Multimedia -y

# Install Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install programs
sudo dnf install gnome-tweaks -y

# Spotify
flatpak install flathub com.spotify.Client -y

# Obsidian
flatpak install flathub md.obsidian.Obsidian -y

# GIMP
flatpak install flathub org.gimp.GIMP -y

# Cozy
flatpak install flathub com.github.geigi.cozy -y

# Telegram
flatpak install flathub org.telegram.desktop -y

# Clean DNF cache after installations
sudo dnf clean all

# Plex
flatpak install flathub tv.plex.PlexDesktop -y

# Deluge
flatpak install flathub org.deluge_torrent.deluge -y

# Eye of Gnome
sudo dnf install eog -y

# Fastfetch
sudo dnf install fastfetch -y

# Geany
flatpak install flathub org.geany.Geany

# Htop
sudo dnf install htop -y

# Git
sudo dnf install git -y

# Make
sudo dnf install make -y

# Extension Mananger
flatpak install flathub com.mattjakeman.ExtensionManager -y

# Install Blur My Shell extension
git clone https://github.com/aunetx/blur-my-shell
cd blur-my-shell
make install
cd ..
sudo rm -rf blur-my-shell

# Install Caffeine extension
git clone https://github.com/eonpatapon/gnome-shell-extension-caffeine.git
cd caffeine
make install
cd .. 
sudo rm -rf caffeine

# Install Hide Uiversal Access extension
git clone https://github.com/akiirui/hide-universal-access.git
cd hide-universal-access
make install
cd ..
sudo rm -rf hide-universal access

# Install Space Bar extension
git clone https://github.com/christopher-l/space-bar.git
sudo dnf install nodejs npm -y
sudo npm install -g typescript
cd space-bar/scripts
npm install
./build.sh

# Install Upower battery extension
cd cd ~/.local/share/gnome-shell/extensions
git clone https://github.com/codilia/upower-battery.git upower-battery@codilia.com

# Install Vitals extension
sudo dnf install libgtop2-devel lm_sensors -y
cd ~/.local/share/gnome-shell/extensions
git clone https://github.com/corecoding/Vitals.git ~/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com -b develop

# Add day of week to gnome title bar
gsettings set org.gnome.desktop.interface clock-show-weekday true


