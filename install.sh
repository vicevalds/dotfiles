#!/bin/sh

cp -r .config .fz* .z* .p* ~/.

#Pacman 
sudo pacman -S qtile lightdm lightdm-webkit2-greeter kitty rofi redshift picom feh ranger zsh 
sudo pacman -S bat mdcat lsd locate cbatticon pulseaudio pavucontrol volumeicon brightnessctl 
sudo pacman -S playerctl udiskie ntfs-3g network-manager-applet imagemagick thunar neofetch 
sudo pacman -S vlc scrot i3lock wget p7zip python-pip pacman-contrib libnotify notification-daemon

#Paru
paru -S lightdm-webkit2-theme-arch zsh-autosuggestions zsh-syntax-highlighting scrub

systemctl enable lightdm.service

cd ~/Desktop/repos/dotfiles/install/

sudo cp main.js index.css /usr/share/lightdm-webkit/themes/lightdm-webkit2-theme-arch
sudo rm /usr/share/lightdm-webkit/themes/lightdm-webkit2-theme-arch/wallpapers/*
sudo cp logoarch.png /usr/share/lightdm-webkit/themes/lightdm-webkit2-theme-arch/wallpapers/00.png
sudo cp lightdm-webkit2-greeter.conf lightdm.conf /etc/lightdm/
cp -r Hack-Nerd-Font /usr/share/fonts
cp -r Tela-purple-dark /usr/share/icons
cp -r Lavanda-Dark /usr/share/themes
cp org.freedesktop.Notifications.service /usr/share/dbus-1/services/
sudo cp install/i3lock-fancy-rapid /opt/
cp onedark.rasi /usr/share/rofi/themes/
cp zsh-sudo /usr/share/zsh/plugins/
sudo cp ~/Desktop/repos/dotfiles/install/root_home/* /root/

usermod --shell /bin/zsh $USER
sudo usermod --shell /bin/zsh root

rofi-theme-selector
