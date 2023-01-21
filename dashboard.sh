#!/usr/bin/bash

bspc rule -a "dash-miniplayer" rectangle=486x732+1131+174
bspc rule -a "dash-simplest-fetch" rectangle=776x466+329+440
bspc rule -a "dash-tty-clock" rectangle=320x240+786+174
bspc rule -a "dash-cava" rectangle=429x240+329+174

if [ "$(cat /tmp/dash-state)" == "open" ]; then
    bspc desktop -f "$(cat /tmp/dash-desk)"
    rm /tmp/dash-desk
    rm /tmp/dash-state
    pkill -f "kitty --class dash-miniplayer -e miniplayer"
    pkill -f "kitty --class dash-simplest-fetch -e simplest-fetch"
    pkill -f "kitty --class dash-tty-clock -e tty-clock"
    pkill -f "kitty --class dash-cava -e cava"
    exit
fi

echo "open" > /tmp/dash-state
echo "$(bspc query -D -d focused --names)" > /tmp/dash-desk
bspc desktop -f '^9'

kitty --class dash-miniplayer -e miniplayer &
kitty --class dash-simplest-fetch -e simplest-fetch &
kitty --class dash-tty-clock -e tty-clock &
kitty --class dash-cava -e cava &

