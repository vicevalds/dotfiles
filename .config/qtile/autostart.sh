#!/bin/sh

# compositor de imagenes
picom &

# systray battery icon
cbatticon -u 5 &

# systray volume
#volumeicon &

# net
nm-applet &

# auto mount usb
udiskie -t &

# Wallpaper
feh --no-fehbg --bg-fill ~/.config/qtile/wallpapers/kali.png &

# latam keymap
setxkbmap latam