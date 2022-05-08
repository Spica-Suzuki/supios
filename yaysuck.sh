#!/bin/bash

__yaykur() { 
    cd /opt/
    sudo git clone https://aur.archlinux.org/yay-git.git
    sudo chown -R susu:susu ./yay-git
    cd yay-git
    makepkg -si
}

__suckless() {
    cd /opt/
    sudo git clone https://github.com/Spica-Suzuki/dwm
    sudo git clone https://github.com/Spica-Suzuki/slock
    sudo git clone https://github.com/Spica-Suzuki/dmenu

    cd /opt/dwm && sudo make clan install
    cd /opt/slock && sudo make clean install
    cd /opt/dmenu && sudo make clean install
}

__autoswap(){
    sudo touch /swapfile
    sudo chattr +C /swapfile
    sudo fallocate -l 4G /swapfile
    sudo chmod 0600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    sudo echo "/swapfile         none        swap       sw                              0 0 " >> /etc/fstab
}

__dns-pacman () {
    sudo echo "nameserver 1.1.1.1" > /etc/resolv.conf
    sudo chattr +i /etc/resolv.conf
    sudo echo "[multilib]" >> /etc/pacman.conf
    sudo echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
    sudo pacman -Syu

}

__turkish () {
    echo "press 0 for english and 1 for turkish"
    read secim
    if [$secim == 1]
    then
        sudo echo "KEYMAP=trq" > /etc/vconsole.conf  
    else
        sudo echo "KEYMAP=us" > /etc/vconsole.conf 
    fi
}

__yay () {
    yay -S alsa alsa-utils alsa-plugins pulseaudio chromium nomacs gimp terminator feh discord nautilus gnome-disk-utility xorg xorg-xinit xorg-server winetricks vlc git wine lua jdk-openjdk 


}

#main ()
__yaykur
__suckless
__autoswap
__dns-pacman
__turkish
__yay
