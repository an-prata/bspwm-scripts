#!/usr/bin/bash

# Intended for use as a polybar module in conjunction
# with the other scripts found in this directory.

OUT=""

if [ $(bspc config window_gap) == "0" ]
then
	if [ $(bspc config bottom_padding) == "0" ]
	then
		OUT=""
	else
		OUT="p"
	fi
elif [ $(bspc config bottom_padding) == "0" ]
then
	OUT="g"
else
	OUT="g, p"
fi

bspc rule -l | grep "*:*:* => state=tiled" > /dev/null

if [ "$?" == "0" ]
then
	echo "Tiling   $OUT"
else
	echo "Floating  "
fi
