#!/bin/sh

mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk 'NF{print $NF}')
if [ $mute="no" ]; then
	pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

playerctl play-pause
/opt/./i3lock-fancy-rapid 5 3
