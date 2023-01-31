#!/bin/sh

#Pacman 
pacman -S pacman-contrib qtile lightdm lightdm-webkit2-greeter kitty rofi redshift picom feh zsh bat mdcat lsd locate cbatticon pulseaudio pavucontrol volumeicon brightnessctl playerctl udiskie ntfs-3g network-manager-applet imagemagick thunar neofetch vlc scrot i3lock wget p7zip python-pip pacman-contrib libnotify notification-daemon

#Paru
paru -S zsh-autosuggestions zsh-syntax-highlighting

systemctl enable lightdm.service

cp -r mv/lightdm-webkit2-theme-arch/ /usr/share/lightdm-webkit/themes/
cp mv/lightdm-webkit2-greeter.conf mv/lightdm.conf /etc/lightdm/

cp -r mv/Hack-Nerd-Font /usr/share/fonts/
#cp -r mv/Tela-purple-dark /usr/share/icons/
#cp -r mv/Lavanda-Dark /usr/share/themes/

chown $1:$1 /usr/share/fonts/Hack-Nerd-Font
#chown $1:$1 /usr/share/icons/Tela-purple-dark
#chown $1:$1 /usr/share/themes/Lavanda-Dark

cp mv/org.freedesktop.Notifications.service /usr/share/dbus-1/services/
cp mv/i3lock-fancy-rapid /opt/
cp mv/onedark.rasi /usr/share/rofi/themes/
cp -r mv/zsh-sudo /usr/share/zsh/plugins/

#root
cp -r mv/root_home/.[z]* /root/
cp -r .config/ /root/

usermod --shell /bin/zsh root

#$USER
cp -r .[z]* /home/$1/
cp -r .config/ /home/$1/

chown $1:$1 /home/$1/.[z]*
chown -R $1:$1 /home/$1/.config/

usermod --shell /bin/zsh $1

reboot
