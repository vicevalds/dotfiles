#!/usr/bin/bash
USER_NAME="$1"
# Add to sudoers file
sudo chmod u+w /etc/sudoers
sudo echo -e "${USER_NAME}\tALL=(ALL:ALL) ALL" >> /etc/sudoers
sudo chmod u-w /etc/sudoers
echo "[!] User ${USER_NAME} added to sudo group"
