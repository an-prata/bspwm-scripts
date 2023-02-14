#!/usr/bin/bash

bspc rule -a "dash-miniplayer" state=floating rectangle=486x732+1131+174
bspc rule -a "dash-calcure" state=floating rectangle=776x466+329+440
bspc rule -a "dash-peaclock" state=floating rectangle=320x240+786+174
bspc rule -a "dash-cava" state=floating rectangle=429x240+329+174
# bspc rule -a "dash-back" state=floating rectangle=1920x1080+0+0

if [ "$(cat /tmp/dash-state)" == "open" ]; then
    set-wallpaper
    # bspc desktop -f "$(cat /tmp/dash-desk)"
    rm /tmp/dash-desk
    rm /tmp/dash-state
    pkill -f "kitty --class dash-miniplayer"
    pkill -f "kitty --class dash-calcure"
    pkill -f "kitty --class dash-peaclock"
    pkill -f "kitty --class dash-cava"
    polybar-msg cmd show
    # pkill -f "kitty --class dash-back"
    while bspc node any.hidden.window -g hidden=off; do :; done
    exit
fi

echo "open" > /tmp/dash-state
echo "$(bspc query -D -d focused --names)" > /tmp/dash-desk
# bspc desktop -f '^9'
polybar-msg cmd hide

# kitty --class dash-back --override background=#cca37a -e ~/.config/bspwm/hold.sh &
# sleep 0.1

while bspc node 'any.!hidden.window' -g hidden=on; do :; done
set-wallpaper --blur

# sleep is for animation type thing
kitty --class dash-miniplayer -e miniplayer &
sleep 0.1
kitty --class dash-calcure -e calcure &
sleep 0.1
kitty --class dash-peaclock -e peaclock &
sleep 0.1
kitty --class dash-cava -e cava &

# this figure has been adjusted for my machine, may need to be readjusted
sleep 0.4

# switch focus from cava to colcure
bspc node -f south

