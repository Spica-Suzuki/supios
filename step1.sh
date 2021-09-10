#!/bin/bash

pacman -S sudo alsa alsa-utils alsa-plugins pulseaudio chromium nomacs gimp terminator feh discord nautilus xorg xorg-xinit xorg-server alsamixer i3-gaps i3blocks i3lock i3status dmenu zsh vlc flameshot

echo "exec i3" >> /etc/X11/xinit/xinitrc

useradd -m susu
mkdir -p /home/susu/wallpaper
mkdir -p /home/susu/.config/i3

cp ./susu/wallpaper/air.jpg /home/susu/wallpaper/air.jpg
cp ./susu/.config/i3/config /home/susu/.config/i3/config
cp ./susu/.profile /home/susu/.profile
chown -R susu:susu /home/susu

cat ./susu/sudoers >> /etc/sudoers
chown susu:susu /opt

git clone https://aur.archlinux.org/yay.git /home/susu/
chown -R  susu:susu /home/susu/yay
su susu
makepkg -si /home/susu/yay
yay -S bumblebee-status

