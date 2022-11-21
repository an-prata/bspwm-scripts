#!/usr/bin/bash

set_floating() {
	bspc rule -r "*"
	bspc rule -a "*" state=floating
	bspc rule -a "fzfmenu" center=true rectangle=800x440+0+0
	$HOME/.config/bspwm/floating-window-default-sizes.sh
	echo "floating" > "/tmp/bspwm-window-state"
	#notify-send "Default window state changed" "Windows will now start floating" -a "bspwm"
}

set_tiling () {
	bspc rule -r "*"
	bspc rule -a "*" state=tiled
	bspc rule -a "fzfmenu" state=floating center=true rectangle=800x440+0+0
	$HOME/.config/bspwm/floating-window-default-sizes.sh
	echo "tiling" > "/tmp/bspwm-window-state"
	#notify-send "Default window state changed" "Windows will now start tiled" -a "bspwm"
}

if [ "$1" == "setup" ]; then
	LAST_STATE="$(cat /tmp/bspwm-window-state)"
	
	if [ "$LAST_STATE" == "floating"]; then
		set_floating
	else
		set_tiling
	fi
fi

LAST_STATE="$(cat /tmp/bspwm-window-state)"

if [ "$LAST_STATE" == "tiling" ]; then
	set_floating
else
	set_tiling
fi

