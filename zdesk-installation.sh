#!/bin/bash
#//////////////////////////////////////////////////////
# About: zDesk Installation Bash Script
# Website: zdesk.ir
# Platform: Ubuntu Server 14.04
# Author: Reza Bakhshayeshi
# E-mail: reza.b2008[at]gmail[dot]com
# Version: 1.0
# Date: 3-11-2015
#//////////////////////////////////////////////////////

if [[ $EUID -ne 0 ]]; then
 echo "Oops! This script must be run as root."
 exit 1
fi

echo " -------------------------------------------------------------------------------"
echo " |                                                                             |"
echo " |                                                                             |"
echo " |                      Inatalling Required Packages                           |"
echo " |                                                                             |"
echo " |                                                                             |"
echo " -------------------------------------------------------------------------------"

apt-get update
apt-get install -y xauth xorg openbox pcmanfm tint2
apt-get install -y kvm virt-manager remmina bridge-utils
apt-get install -y roxterm volti xfce4-mixer xfce4-power-manager lxappearance dmz-cursor-theme gnome-brave-icon-theme shimmer-themes gsimplecal
apt-get install -y lightdm-gtk-greeter
apt-get install -y lightdm light-locker
apt-get install -y arandr wicd ntfs-config uswsusp pulseaudio python-spice-client-gtk spice-client

echo "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &" >> /etc/xdg/openbox/autostart
echo "eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &" >> /etc/xdg/openbox/autostart
echo "pcmanfm --desktop &" >> /etc/xdg/openbox/autostart
echo "(sleep 3 && pcmanfm --set-wallpaper=$HOME/wallpaper.jpg) &" >> /etc/xdg/openbox/autostart
echo "(sleep 3 && pcmanfm --wallpaper-mode=stretch) &" >> /etc/xdg/openbox/autostart
echo "(sleep 4 && tint2) &" >> /etc/xdg/openbox/autostart
echo "(sleep 1 && sudo volti) &" >> /etc/xdg/openbox/autostart
echo "(sleep 1 && xfce4-power-manager) &" >> /etc/xdg/openbox/autostart

sed -i "s/background=\/usr\/share\/backgrounds\/warty-final-ubuntu.png/background=\/etc\/skel\/wallpaper-4.png/g" /etc/lightdm/lightdm-gtk-greeter.conf
sed -i "s/theme-name=Ambiance/theme-name=Orion/g" /etc/lightdm/lightdm-gtk-greeter.conf
sed -i "s/icon-theme-name=LoginIcons/icon-theme-name=GNOME-Brave/g" /etc/lightdm/lightdm-gtk-greeter.conf

echo " -------------------------------------------------------------------------------"
echo " |                                                                             |"
echo " |                                                                             |"
echo " |                   **Inatallation Finished Successfully**                    |"
echo " |                                                                             |"
echo " |  copy or replace etc-skel files both in your home and /etc/skel/ directory  |"
echo " |                          and reboot the system.                             |"
echo " |                                                                             |"
echo " |                                                                             |"
echo " -------------------------------------------------------------------------------"