#!/usr/bin/bash

bspc rule -a "dash-miniplayer" state=floating rectangle=486x732+1131+174
bspc rule -a "dash-simplest-fetch" state=floating rectangle=776x466+329+440
bspc rule -a "dash-tty-clock" state=floating rectangle=320x240+786+174
bspc rule -a "dash-cava" state=floating rectangle=429x240+329+174
# bspc rule -a "dash-back" state=floating rectangle=1920x1080+0+0

if [ "$(cat /tmp/dash-state)" == "open" ]; then
    bspc desktop -f "$(cat /tmp/dash-desk)"
    rm /tmp/dash-desk
    rm /tmp/dash-state
    pkill -f "kitty --class dash-miniplayer"
    pkill -f "kitty --class dash-simplest-fetch"
    pkill -f "kitty --class dash-tty-clock"
    pkill -f "kitty --class dash-cava"
    polybar-msg cmd show
    # pkill -f "kitty --class dash-back"
    exit
fi

echo "open" > /tmp/dash-state
echo "$(bspc query -D -d focused --names)" > /tmp/dash-desk
bspc desktop -f '^9'
polybar-msg cmd hide

# kitty --class dash-back --override background=#cca37a -e ~/.config/bspwm/hold.sh &
# sleep 0.1

# sleep is for animation type thing
kitty --class dash-miniplayer -e miniplayer &
sleep 0.1
kitty --class dash-simplest-fetch -e simplest-fetch &
sleep 0.1
kitty --class dash-tty-clock -e tty-clock -t -C 3 &
sleep 0.1
kitty --class dash-cava -e cava &
sleep 0.1

