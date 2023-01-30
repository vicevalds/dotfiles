# dotfiles

Mis dotfiles corresponden a una personalización del entorno de escritorio 
diseñado por [Antonio Sarosi](https://github.com/antoniosarosi/dotfiles).

### Componentes:

| Software             | Función                    |
| -------------------- | -------------------------- |
| Qtile                | Window tiling manager      |
| Kitty                | Terminal                   |
| Zsh                  | Interpretador de comandos  |
| Rofi                 | Menu                       |
| Thunar               | Explorador de archivos GUI |
| Neovim (NVChad)      | Editor de texto            |


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
useradd -m -G wheel,storage,power,audio,network -s /bin/bash <user name>
passwd <user name>
```
>editar */etc/sudoers/* para permitir que los usuarios del grupo wheel
ejecuten comandos.

###### Paquetes de visualización

```bash
pacman -S xorg xorg-server xorg-xinit
```

###### Detectar otros sistemas operativos

```bash
sudo pacman -S os-prober
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
>En caso de no funcionar, se debe descomentar #GRUB_DISABLE_OS_PROBER=false, 
en */etc/default/grub*. 

### Aur helper

```bash
sudo pacman -S git base-devel
mkdir -p Desktop/repos
cd Desktop/repos/
git clone https://aur.archlinux.org/paru-git.git
cd paru
makepkg -si
```

### BlackArch unofficial user repository
[Link](https://www.blackarch.org/downloads.html)
```bash
cd ~/Desktop/repos/
curl -O https://blackarch.org/strap.sh
echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c
chmod +x strap.sh
sudo ./strap.sh
sudo pacman -Syu
```

# Instalación dotfiles

```bash
cd Desktop/repos/
git clone https://github.com/vicevalds/dotfiles.git
```

## Instalacion automatica

Para instalar de manera automatica los ficheros del directorio *mv* 
ejecutar el fichero *install.sh* como usuario privilegiado.

```bash
sudo su
cd Desktop/repos/dotfiles/
./install.sh <user>
```
A considerar:
1. No contempla la intalación de neovim y NVChad.
2. Se debe instalar por separado el tema y los iconos.
3. Los iconos a descargar deben ser Tela-purple-dark.
4. Se debe instalar fzf desde su repositorio asi como la powerlevel10k.
5. Se debe copiar la configuracion de la powerlevel10k en reemplazo de la generada
por la instalacion desde su repositorio. 

## Instalacion manual

### Entorno de escritorio

```bash
sudo pacman -S qtile lightdm lightdm-webkit2-greeter 
systemctl enable lightdm.service
cd ~/Desktop/repos/dotfiles/mv/
sudo cp lightdm-webkit2-greeter.conf lightdm.conf /etc/lightdm/
```
Mi tema de lightdm es un fork de este repositorio 
[lightdm-webkit2-theme-arch](https://github.com/kenogo/lightdm-webkit2-theme-arch), 
el cual se puede encontrar en aur.

>Contiene cambios esteticos como distintos [wallpapers](https://bbs.archlinux.org/viewtopic.php?id=259604) 
y fuentes.


### Software

```bash
sudo pacman -S pacman-contrib kitty rofi redshift picom feh zsh bat mdcat lsd locate cbatticon pulseaudio 
pavucontrol volumeicon brightnessctl playerctl udiskie ntfs-3g network-manager-applet imagemagick 
thunar neofetch vlc scrot i3lock wget p7zip python-pip
```


### Instalar y ajustar neovim con NVChad

[NVChad](https://nvchad.com/quickstart/install) indica la version de [neovim](https://github.com/neovim/neovim/releases)
necesaria para que la IDE sea estable. Fuente: [GitHub](https://github.com/NvChad/NvChad).

```bash
cd ~/Downloads/
tar -xvf nvim-linux64*
mv nvim-linux64 /opt
cd /bin
sudo ln -sf /opt/nvim-linux64/bin/nvim nvim
sudo ln -sf nvim vim
```
> Luego instalar [NVChad](https://nvchad.com/quickstart/install) como lo indica en la web.


## Theme, fonts and icons
Theme [Lavanda-Dark](https://github.com/vinceliuice/Lavanda-gtk-theme)
Icons [Tela-purple-dark](https://github.com/vinceliuice/Tela-icon-theme)
Font [Hack-Nerd-Font](https://www.nerdfonts.com/font-downloads)

```bash
cd ~/Downloads/
cp -r Hack-Nerd-Font /usr/share/fonts/
cp -r Tela-purple-dark /usr/share/icons/
cp -r Lavanda-Dark /usr/share/themes/
```

### Notificaciones
```bash
sudo pacman -S libnotify notification-daemon
cd ~/Desktop/repos/dotfiles/mv
cp org.freedesktop.Notifications.service /usr/share/dbus-1/services/
```

### Bloqueo de pantalla con i3lock-fancy-rapid

```bash
cd ~/Desktop/repos/dotfiles/mv
sudo cp i3lock-fancy-rapid /opt/
```

### Tema rofi
El tema onedark en mv/ es una modificacion del tema original [onedark](https://github.com/newmanls/rofi-themes-collection),
pues considera iconos Tela-purple-dark y arregla un error respecto a la barra de seleccion.
```bash
sudo cp ~/Desktop/repos/dotfiles/mv/onedark.rasi /usr/share/rofi/themes/
```

### Zsh
Para usar zsh se debe establecer como terminal por defecto del usuario 

```bash
paru -S zsh-autosuggestions zsh-syntax-highlighting
cd 
usermod --shell /bin/zsh $USER
sudo usermod --shell /bin/zsh root
```

> [Plugin-sudo](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh) para zsh.
> ```bash
> cp ~/Desktop/repos/dotfiles/mv/zsh-sudo /usr/share/zsh/plugins/
> ```
>> Para ocupar, usar esc-esc o alt-esc.

## Powerlevel10k
Tras instalada la powerlevel10k desde su repositorio, se debe mover a .config y reemplazar el fichero
.p10.zsh por el generado tras la instalacion.

Para cambiar las configuraciones de la powerlevel10k se debe ejecutar el fichero .p10k.zsh.
La configuracion es unica para cada usuario.

```bash
./.p10k.zsh
```

## Fzf
[Fzf](https://github.com/junegunn/fzf), buscador inteligente. 
Antes de utilizar se deben sincronizar los archivos del sistema con el comando *updatedb*.
Contempla como dependencia el paquete *locate*. 

```bash
updatedb
```
Utilizar fzf:
1. ctrl+t para buscar en un directorio
2. ctrl+r para ver coincidencias del historial en la terminal 

## Personalizacion del entorno root

```bash
sudo su
cd
cp ~/Desktop/repos/dotfiles/install/root_home/.[cfzp]* . 
```

## Utilidades
```bash
sudo pacman -S discord
paru -S libreoffice-bin
paru -S librewolf-bin
sudo pacman -S scrub
```
