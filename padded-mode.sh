#!/usr/bin/bash

if [ "$1" == "setup" ]
then
	bspc config top_padding			108
	bspc config bottom_padding		98
	bspc config right_padding		180
	bspc config left_padding		180
elif [ $(bspc config bottom_padding) == "0" ]
then
	bspc config top_padding			108
	bspc config bottom_padding		80
	bspc config right_padding		180
	bspc config left_padding		180
else
	bspc config top_padding			28
	bspc config bottom_padding		0
	bspc config right_padding		0
	bspc config left_padding		0
fi

