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
feh --bg-tile ~/.config/qtile/themes/warning.png & 
