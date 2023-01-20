# dotfiles

## Instalación Arch

1. Error de la .iso

```
    **Esto es negrita**
```

´´´bash
pacman -Syu
pacman -Sy archlinux-keyring
pacman -Sy openssl
´´´

2. Cargador de arranque

´´´bash
pacman -S grub efibootmgr
grub-install target=x86_64
grubconfig
´´´

3. Conexión a internet

´´´bash
pacman -S networkmanager wpa_supplicant
systemctl enable NetworkManager.service
´´´

4. Users

´´´bash
useradd -u <user> -G wheel,storage,power,audio,network
passwd <user>
´´´
> editar */etc/sudoers/* para permitir que los usuarios del grupo wheel
ejecuten comandos.

5. Aur helper

´´´bash
pacman -S git base-devel
mkdir ~/Desktop/repos
cd ~/Desktop/repos
git clone https://aur.archlinux.org/paru-git.git
cd paru
makepkg -si
´´´

6. Paquetes gráficos

´´´bash
pacman -S xorg xorg-server
´´´

# Instalación dotfiles

´´´bash
cd ~/Desktop/repos
git clone https://github.com/vicevalds/dotfiles.git
´´´

## Entorno de escritorio

´´´bash
sudo pacman -S qtile lightdm lightdm-webkit2-greeter
systemctl enable lightdm.service
cd ~/Desktop/repos/dotfiles
cp -r move_to/lightdm-webkit2-theme-arch/ /usr/share/lightdm-webkit/themes/lightdm-webkit2-theme-arch
cp move_to/*.conf /etc/lightdm/
´´´

###### Activar widget para ver las actualizaciones

´´´bash
sudo pacman -S pacman-contrib
´´´

> Browser
´´´bash
sudo pacman -S firefox
´´´

## Theme, fonts and icons

´´´bash
cd ~/Desktop/repos/dotfiles/move_to
cp -r Hack-Nerd-Font /usr/share/fonts
cp -r Tela-purple-dark /usr/share/icons
cp -r Lavanda-Dark /usr/share/themes
´´´

## Notificaciones
´´´bash
sudo pacman -S libnotify notification-daemon
cd ~/Desktop/repos/dotfiles/move_to
cp org.freedesktop.Notifications.service ????????????????????
´´´

## Mis software

´´´bash
sudo pacman -S kitty rofi redshift picom neovim feh ranger zsh zsh-autosuggestions zsh-syntax-highlighting 
bat lsd locate cbatticon pulseaudio pavucontrol volumeicon brightnessctl udiskie network-manager-applet 
imagemagick thunar neofetch vlc scrot wget p7zip python-pip
´´´

# Personalización
´´´bash
cd 
cp ~/Desktop/repos/dotfiles/.config . 
´´´

###### Wallpaper con feh
´´´bash
cd
mkdir Images
cp ~/Desktop/repos/dotfiles/flowers_DALLE2.png Images/
´´´

###### Tema rofi

´´´bash
cd ~/Desktop/repos/dotfiles/move_to
cp onedark.rasi /usr/share/rofi/themes
rofi-theme-selector
´´´

###### Zsh

´´´bash
cd 
cp ~/Desktop/repos/dotfiles/move_to/.z* . 
ch <user> --shell /bin/zsh
sudo ch root --shell /bin/zsh 
´´´

###### Powerlevel10k
Copio de mis dotfiles por comodidad. Powerlevel10k proviene de este repositorio.
´´´bash
cd 
cp ~/Desktop/repos/dotfiles/move_to/.p10k.zsh . 
´´´

###### Fzf
Copio de mis dotfiles por comodidad. Fzf proviene de este repositorio.
´´´bash
updatedb
cd 
cp -r ~/Desktop/repos/dotfiles/move_to/.f* . 
´´´

###### Personalizaciones para Root

´´´bash
sudo su
cd
cp ~/Desktop/repos/dotfiles/move_to/root_home/* . 
´´´

> Utilidades
´´´bash
sudo pacman -S discord
paru -Si libreoffice-bin
´´´

Completar!!!!!!!!!!!
1. neovim 
2. ranger
3. bloqueo de pantalla
