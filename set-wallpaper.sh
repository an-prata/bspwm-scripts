#!/usr/bin/bash

if [[ "$1" == "--blur" ]]; then
	feh --bg-fill "$HOME/.config/set-wallpaper/wallpaper-blur"
elif [[ "$1" != "" ]]; then
	feh --bg-fill "$1"
	mkdir -p "$HOME/.config/set-wallpaper/"
	rm -rf "$HOME/.config/set-wallpaper/*"
	cp "$1" "$HOME/.config/set-wallpaper/wallpaper"
	magick "$1" -blur 0x32 "$HOME/.config/set-wallpaper/wallpaper-blur"
else
	feh --bg-fill "$HOME/.config/set-wallpaper/wallpaper"
fi

