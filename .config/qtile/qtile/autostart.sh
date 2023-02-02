#!/bin/sh

#compositor de imagenes
picom &

# systray battery icon
cbatticon -u 5 &

# systray volume
volumeicon &

# net
nm-applet &

#auto mount usb
udiskie -t &

# Wallpaper
feh --bg-fill ~/.config/qtile/themes/warning.png & 
