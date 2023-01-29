#!/bin/sh

#Pacman 
pacman -S qtile lightdm lightdm-webkit2-greeter kitty rofi redshift picom feh ranger zsh bat mdcat lsd locate cbatticon pulseaudio pavucontrol volumeicon brightnessctl playerctl udiskie ntfs-3g network-manager-applet imagemagick thunar neofetch vlc scrot i3lock wget p7zip python-pip pacman-contrib libnotify notification-daemon

#Paru
paru -S zsh-autosuggestions zsh-syntax-highlighting lightdm-webkit2-theme-arch

systemctl enable lightdm.service

cp -r lightdm-webkit2-theme-arch/ /usr/share/lightdm-webkit/themes/
cp lightdm-webkit2-greeter.conf lightdm.conf /etc/lightdm/
cp -r Hack-Nerd-Font /usr/share/fonts/
cp -r Tela-purple-dark /usr/share/icons/
cp -r Lavanda-Dark /usr/share/themes/
cp org.freedesktop.Notifications.service /usr/share/dbus-1/services/
cp i3lock-fancy-rapid /opt/
cp onedark.rasi /usr/share/rofi/themes/
cp -r zsh-sudo /usr/share/zsh/plugins/
cp -r root_home/.[cpzf]* /root/

usermod --shell /bin/zsh root

rofi-theme-selector
