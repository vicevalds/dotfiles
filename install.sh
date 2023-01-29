#!/bin/sh

#Pacman 
pacman -S qtile lightdm lightdm-webkit2-greeter kitty rofi redshift picom feh ranger zsh bat mdcat lsd locate cbatticon pulseaudio pavucontrol volumeicon brightnessctl playerctl udiskie ntfs-3g network-manager-applet imagemagick thunar neofetch vlc scrot i3lock wget p7zip python-pip pacman-contrib libnotify notification-daemon

#Paru
paru -S zsh-autosuggestions zsh-syntax-highlighting

systemctl enable lightdm.service

cp -r install/lightdm-webkit2-theme-arch/ /usr/share/lightdm-webkit/themes/
cp install/lightdm-webkit2-greeter.conf install/lightdm.conf /etc/lightdm/
cp -r install/Hack-Nerd-Font /usr/share/fonts/
cp -r install/Tela-purple-dark /usr/share/icons/
cp -r install/Lavanda-Dark /usr/share/themes/
cp install/org.freedesktop.Notifications.service /usr/share/dbus-1/services/
cp install/i3lock-fancy-rapid /opt/
cp install/onedark.rasi /usr/share/rofi/themes/
cp -r install/zsh-sudo /usr/share/zsh/plugins/
cp -r install/root_home/.[cpzf]* /root/

usermod --shell /bin/zsh root

if [ $# -eq 1 ]; then
	cp -r .[cpzf]* /home/$1/
	usermod --shell /bin/zsh $1
fi

echo "A continuación selecciona onedark para el tema de rofi"
sleep 3  
rofi-theme-selector
