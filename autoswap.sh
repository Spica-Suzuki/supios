#!/bin/bash
touch /swapfile
chattr +C /swapfile
fallocate -l 4G /swapfile
chmod 0600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile         none        swap       sw                              0 0 " >> /etc/fstab
