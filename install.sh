#!/bin/bash

# exit status (1):
#   permission error so run it as root.
#
# exit status (2):
#   unknown error causes these functions or some other reason
#
# exit status (3):
#   unknow distribution.

[[ -f /etc/arch-release ]] && { echo "Please use this script on arch linux based distribution." ; exit 3 ; }
[[ ${UID} != 0 ]] && { echo "Ah Ah Ah! You didn't say the magic word!" ; exit 1 ; }

__get-depends() {
    # Add repository
    cp ./susu/resolv.conf /etc/resolv.conf
    chattr +i /etc/resolv.conf
    cp ./susu/pacman.conf /etc/pacman.conf

    # Get Depedencies
    pacman -Syyu --noconfirm && pacman -Syy --noconfirm "sudo" "alsa" "alsa-utils" "alsa-plugins" "pulseaudio" "chromium" "nomacs" "gimp" "terminator" "feh" "discord" "nautilus" "xorg" "xorg-xinit" "xorg-server" "alsamixer" "i3-gaps" "i3blocks" "i3lock" "i3status" "dmenu" "zsh" "vlc" "flameshot" "git" "wine" "base-devel"
    sudo -u "${SUDO_USER:-${USER}}" bash -c "cd /tmp && git clone https://aur.archlinux.org/bumblebee-status.git && cd bumblebee-status &&  makepkg -si"
}

__setup() {
    # Write Xinit conf
    [[ -f /etc/X11/xinit/xinitrc ]] && echo "exec i3" >> /etc/X11/xinit/xinitrc

    # Copy User Confs ( under home)
    cp ./susu/wallpaper/air.jpg /home/"${SUDO_USER:-${USER}}"/wallpaper/air.jpg
    cp ./susu/.config/i3/config /home/"${SUDO_USER:-${USER}}"/.config/i3/config
    cp ./susu/.profile /home/"${SUDO_USER:-${USER}}"/.profile
}

# Main()
echo "Installing Dependencies.."
__get-depends && echo "All Dependecies installed successfully." || { echo "unknow error occured please check that function" ; exit 2 ; }
echo "Setting Up.."
__setup && echo "All files copied successfully." || { echo "unknow error occured please check that function" ; exit 2 ; }
echo "Finished."

