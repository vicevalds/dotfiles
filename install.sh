#!/bin/sh

endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"

if [ $# -eq 1 ]; then
	if [ $(ls /home | grep -w "${1}") ]; then
		if [ $USER -eq root 2&>/dev/null ]; then
			#Pacman 
			pacman -S pacman-contrib qtile lightdm lightdm-webkit2-greeter kitty rofi redshift picom feh zsh bat mdcat lsd locate cbatticon pulseaudio pavucontrol volumeicon brightnessctl playerctl udiskie ntfs-3g network-manager-applet imagemagick thunar neofetch vlc scrot i3lock wget p7zip python-pip pacman-contrib libnotify notification-daemon

			#Paru
			paru -S zsh-autosuggestions zsh-syntax-highlighting

			echo -e "\n\n\t[!] Utilidades\n"

			paru -S librewolf-bin
		
			systemctl enable lightdm.service
	
			git clone https://github.com/vicevalds/lightdm-webkit2-gif-theme /usr/share/lightdm-webkit/themes/
			cp mv/lightdm-webkit2-greeter.conf mv/lightdm.conf /etc/lightdm/

			cp -r mv/Hack-Nerd-Font /usr/share/fonts/
			chown -R $1:$1 /usr/share/fonts/Hack-Nerd-Font

			cp mv/org.freedesktop.Notifications.service /usr/share/dbus-1/services/
			cp mv/i3lock-fancy-rapid /opt/
			cp mv/lock.sh /opt/
			cp mv/onedark.rasi /usr/share/rofi/themes/
			cp -r mv/zsh-sudo /usr/share/zsh/plugins/

			#root
			cp -r mv/root_home/.[cz]* /root/

			usermod --shell /bin/zsh root

			#$USER
			cp -r .[cz]* /home/$1/
			chown -R $1:$1 /home/$1/.[cz]*

			usermod --shell /bin/zsh $1

			sudo localectl set-x11-keymap latam

			reboot
		else
			echo -e "\n\n\t${redColour}[!]${endColour} Your user must be root (sudo su)\n"
		fi
	else
		echo -e "\n\n\t${redColour}[!]${endColour} The indicated user does not exist\n"
	fi
else
	echo -e "\n\n\t${redColour}[!]${endColour} ./install.sh [non-privileged user]\n"	
fi


