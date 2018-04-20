#!/bin/bash
##
## Installs snaps I need for my machines. 
##
# Based on
# https://unix.stackexchange.com/questions/310361/packages-to-be-install-in-a-for-loop-if-not-installed
set -e
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;} # Need to figure out how to pkexec so we only ask for the password once.

snap install chromium communitheme darktable discord docker fast firefox gimp gitkraken gmusic gnome-3-26-1604 gnome-calculator google-play-music-desktop-player google-webapp gotop htop hugo inkscape irssi libreoffice lxd mailspring musescore mutt obs-studio sdlpop signal-desktop snappy-debug spotify vidcutter vlc youtube-dl-casept

CLASSICREQPKGS=(android-studio atom blender vscode sublime-text restic node intellij-idea-community hollywood go google-cloud-sdk kubectl)

for pkg in "${CLASSICREQPKGS[@]}"; do
        snap install "$pkg" --classic && echo "Successfully installed $pkg"
done

