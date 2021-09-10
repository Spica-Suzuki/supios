#!/bin/bash

pacman -S sudo chromium nomacs gimp terminator feh discord nautilus i3-gaps i3blocks i3lock i3status dmenu zsh vlc

# add user
useradd -m susu
mkdir -p /home/susu/wallpaper
mkdir -p /home/susu/.config/i3

# user setup susu
cp ./susu/wallpaper/air.jpg /home/susu/wallpaper/air.jpg
cp ./susu/.config/i3/config /home/susu/.config/i3/config
cp ./susu/.profile /home/susu/.profile
chown -R susu:susu /home/susu

# add susu to sudoers
cat ./susu/sudoers >> /etc/sudoers

chown susu:susu /opt
