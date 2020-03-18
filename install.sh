#!/bin/bash
##
## Installs snaps I need for my machines. 
##
# Based on
# https://unix.stackexchange.com/questions/310361/packages-to-be-install-in-a-for-loop-if-not-installed
set -e
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;} # Need to figure out how to pkexec so we only ask for the password once.

snap install chromium darktable discord docker fast firefox gimp htop hugo inkscape libreoffice lxd mailspring obs-studio signal-desktop vlc youtube-dl-casept krita youtube-music-desktop-app bluemail

CLASSICREQPKGS=(blender code restic node go kubectl slack skype)

for pkg in "${CLASSICREQPKGS[@]}"; do
        snap install "$pkg" --classic && echo "Successfully installed $pkg"
done

