#!/bin/bash

# Get root permissions for DNF commands
if (($EUID != 0)); then
  if [[ -t 1 ]]; then
    sudo "$0" "$@"
  fi
  exit 1
fi

# Run dnf update
read -p "Do you want to run a DNF update? (yes/no) " yn

case $yn in 
	[Yy] ) dnf update -y;;
	[Nn] ) echo "Skipping update";;
	* ) echo "Invalid response, assuming no";;
esac

# Enable hyprland copr
dnf copr enable solopasha/hyprland -y >> /dev/null 2>&1
echo "Installing hyprland packages"
dnf install eww-wayland-git \
	hyprland-git \
	hyprland-plugins \
	hyprpaper \
	hyprpicker \
	libdisplay-info \
	libinput \
	libliftoff \
	waybar-hyprland \
	xdg-desktop-portal-hyprland -y

