# dotfiles

### Software:

| Software             | Description                |
| -------------------- | -------------------------- |
| [Qtile](https://github.com/qtile/qtile)              | Tiling window manager      |
| [Picom](https://github.com/yshui/picom)              | Image composer             |
| [Kitty](https://sw.kovidgoyal.net/kitty/)              | Terminal                   |
| Zsh                  | Command interpreter        |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Zsh plugin|
| [Fzf](https://github.com/junegunn/fzf)  | Zsh plugin |
| [Lsd](https://github.com/lsd-rs/lsd) | ls delux command |
| Rofi                 | Menu                       |
| Nautilus             | File explorer GUI          |
| [NVChad](https://github.com/NvChad/NvChad)             | Text Editor                |
| Flameshot            | Screenshots                |
| [i3lock](https://github.com/yvbbrjdr/i3lock-fancy-rapid)             | Screensaver                |
| [BlackArch](https://www.blackarch.org/downloads.html)      | The unofficial user repository |

**Arch based**
```bash
sudo pacman -S kitty rofi redshift feh zsh bat locate cbatticon pulseaudio pavucontrol volumeicon brightnessctl playerctl udiskie ntfs-3g network-manager-applet imagemagick thunar neofetch vlc flameshot i3lock p7zip python-pip python3-venv lxappearance libnotify notification-daemon libxcb-util0-dev libxcb-image0-dev build-essential xclip net-tools cmake
```

**Debian based**
```bash
sudo apt install kitty rofi redshift feh zsh bat locate cbatticon pavucontrol brightnessctl playerctl udiskie ntfs-3g imagemagick thunar neofetch vlc flameshot i3lock p7zip lxappearance xclip build-essential cmake
```

<details>
<summary>Arch Installation Notes</summary>

### Via wifi 
```bash
iwctl
station show list
station [network interface] connect [SSID] psk
exit
```

### Grub Installation
```bash
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

### Internet connection
```bash
pacman -S networkmanager wpa_supplicant
systemctl enable NetworkManager.service
```

### Users
```bash
useradd -m -G wheel,storage,power,audio,network -s /bin/bash [user]
passwd [user]
```
>remember to edit the `/etc/sudoers` files to allow users of the wheel group to execute commands.

### Graphics packages
```bash
pacman -S xorg xorg-server xorg-xinit
```

### Dual boot
```bash
sudo pacman -S os-prober
sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Aur helper
```bash
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/paru-git.git
cd paru
makepkg -si
```

</details>

## Some considerations

1. The qtile developers recommend install qtile using 
```bash
pip install git+https://github.com/qtile/qtile
```
3. After installation run to configure the latam keyboard layout.
```bash
sudo localectl set-x11-keymap latam
```
4. Install `pacman-contrib` to see Arch's pending updates in a qtile widget.
5. Before using Fzf you must synchronize the system files with `updatedb` from the *locate* package.
6. After installing `lightdm` and `lightdm-webkit2-greeter`, run `systemctl enable lightdm.service` and edit the `lightdm-webkit2-greeter.conf` and `lightdm.conf` files in `/etc/lightdm`.
7. For the Rofi theme copy `onedark.rasi` into `/usr/share/rofi/themes/`.
8. Copy [Hack-Nerd-Font](https://www.nerdfonts.com/font-downloads), [Tela-icon-theme](https://github.com/vinceliuice/Tela-icon-theme), and [Lavanda-Dark](https://github.com/vinceliuice/Lavanda-gtk-theme) into `/usr/share/{fonts,icons,themes}`.
9. For notifications in arch, copy `org.freedesktop.Notifications.service` into `/usr/share/dbus-1/services`.
10. For screen locking with [i3lock-fancy-rapid](https://github.com/yvbbrjdr/i3lock-fancy-rapid) copy `lock.sh` into `/opt`.
11. Copy [sudo-plugin](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh) into `/usr/share`. To use, esc-esc or alt-esc.

### To set the trackpad use:
```bash
sudo apt install xserver-xorg-input-synaptics
reboot
synclient tapbutton1=1
```

<details>
<summary>Fzf shortcuts</summary> 

1. Ctrl+t to search in a directory.
2. Ctrl+r to view history matches.
3. Alt+c to enter the pre-selected directory.

</details>
