# dotfiles

# Instalación Arch

###### Error de la .iso

```bash
pacman -Syu
pacman -Sy archlinux-keyring
pacman -Sy openssl
```

###### Cargador de arranque

```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

###### Conexión a internet

```bash
pacman -S networkmanager wpa_supplicant
systemctl enable NetworkManager.service
```

###### Users

```bash
passwd
useradd -m -G wheel,storage,power,audio,network -s /bin/bash <user>
passwd <user>
```
> editar */etc/sudoers/* para permitir que los usuarios del grupo wheel
ejecuten comandos.

###### Sistema de visualización

```bash
pacman -S xorg xorg-server
```

###### Detectar otros sistemas operativos

```bash
sudo pacman -S os-prober
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
> En caso de no funcionar, se debe descomentar #GRUB_DISABLE_OS_PROBER=false, 
en */etc/default/grub*. 

# Instalación dotfiles

```bash
cd
mkdir -p Desktop/repos
cd Desktop/repos/
git clone https://github.com/vicevalds/dotfiles.git
cd dotfiles
cp -r .config /home/<user>/
```

## Aur helper

```bash
sudo pacman -S git base-devel
cd Desktop/repos/
git clone https://aur.archlinux.org/paru-git.git
cd paru
makepkg -si
```

# Entorno de escritorio

```bash
sudo pacman -S qtile lightdm lightdm-webkit2-greeter 
paru -S lightdm-webkit2-theme-arch 
systemctl enable lightdm.service
cd ~/Desktop/repos/dotfiles/move/
sudo cp main.js index.css /usr/share/lightdm-webkit/themes/lightdm-webkit2-theme-arch
sudo rm /usr/share/lightdm-webkit/themes/lightdm-webkit2-theme-arch/wallpapers/*
sudo cp logoarch.png /usr/share/lightdm-webkit/themes/lightdm-webkit2-theme-arch/wallpapers/00.png
sudo cp lightdm-webkit2-greeter.conf lightdm.conf /etc/lightdm/
```

# Software

```bash
sudo pacman -S kitty rofi redshift picom feh ranger zsh bat mdcat lsd locate cbatticon pulseaudio 
pavucontrol volumeicon brightnessctl playerctl udiskie ntfs-3g network-manager-applet imagemagick 
thunar neofetch vlc scrot i3lock wget p7zip python-pip
```

## Instalar y ajustar neovim

```bash

cd /bin
sudo ln -sf nvim vim
```

## Activar widget para ver actualizaciones disponibles

```bash
sudo pacman -S pacman-contrib
```

> Browser
```bash
sudo pacman -S firefox
```

## Theme, fonts and icons

```bash
cd ~/Desktop/repos/dotfiles/move
cp -r Hack-Nerd-Font /usr/share/fonts
cp -r Tela-purple-dark /usr/share/icons
cp -r Lavanda-Dark /usr/share/themes
```

## Notificaciones
```bash
sudo pacman -S libnotify notification-daemon
cd ~/Desktop/repos/dotfiles/move
cp org.freedesktop.Notifications.service /usr/share/dbus-1/services/
```

## Bloqueo de pantalla con i3lock-fancy-rapid

```bash
cd ~/Desktop/repos/dotfiles/move
sudo cp move/i3lock-fancy-rapid /opt/
```


## Neovim con NVChad
Instalar la version de [neovim](https://github.com/neovim/neovim/releases) 
indicada por [NVChad](https://nvchad.com/quickstart/install).
Fuente: [GitHub](https://github.com/NvChad/NvChad) 


## Tema rofi

```bash
cd ~/Desktop/repos/dotfiles/move
cp onedark.rasi /usr/share/rofi/themes/
rofi-theme-selector
```

## Zsh

```bash
paru -S zsh-autosuggestions zsh-syntax-highlighting
cd 
cp ~/Desktop/repos/dotfiles/.z* . 
usermod --shell /bin/zsh <user>
sudo usermod --shell /bin/zsh root
paru -S scrub
```

> Plugin sudo para zsh de este [repositorio](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh).
>```bash
>cd ~/Desktop/repos/dotfiles/move/
>cp zsh-sudo /usr/share/zsh/plugins/
>```
>>Para ocupar usar esc-esc o alt-esc

## Powerlevel10k
Powerlevel10k proviene de este [repositorio](https://github.com/romkatv/powerlevel10k).
```bash
cd 
cp ~/Desktop/repos/dotfiles/.p10k.zsh . 
```

## Fzf
Fzf proviene de este [repositorio](https://github.com/junegunn/fzf).
```bash
updatedb
cd 
cp -r ~/Desktop/repos/dotfiles/.f* . 
```

## Personalizacion Root

```bash
sudo su
cd
cp ~/Desktop/repos/dotfiles/move/root_home/* . 
```

## Utilidades
```bash
sudo pacman -S discord
paru -S libreoffice-bin
paru -S librewolf-bin
```

## BlackArch Repositorie
[Link](https://www.blackarch.org/downloads.html)
```bash
cd ~/Desktop/repos/
curl -O https://blackarch.org/strap.sh
echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu
```
