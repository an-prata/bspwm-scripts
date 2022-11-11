#!/usr/bin/bash

if [ "$1" == "setup" ]
then
	bspc rule -r "*"
	bspc rule -a "*" state=tiled
	bspc rule -a "fzfmenu" state=floating center=true rectangle=800x440+0+0
	exit
fi

bspc rule -l | grep "*:*:* => state=tiled" > /dev/null

if [ "$?" == "0" ]
then
	bspc rule -r "*"
	bspc rule -a "*" state=floating
	bspc rule -a "fzfmenu" center=true rectangle=800x440+0+0
	$HOME/.config/bspwm/floating-window-default-sizes.sh
	#notify-send "Default window state changed" "Windows will now start floating" -a "bspwm"
else
	bspc rule -r "*"
	bspc rule -a "*" state=tiled
	bspc rule -a "fzfmenu" state=floating center=true rectangle=800x440+0+0
	$HOME/.config/bspwm/floating-window-default-sizes.sh
	#notify-send "Default window state changed" "Windows will now start tiled" -a "bspwm"
fi

