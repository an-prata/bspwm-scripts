#!/usr/bin/bash

# Intended for use as a polybar module in conjunction
# with the ther scripts found in this directory.

bspc rule -l | grep "*:*:* => state=tiled" > /dev/null

if [ "$?" == "0" ]
then
	echo "Tiling"
else
	echo "Floating"
fi
