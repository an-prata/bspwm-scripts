#!/usr/bin/bash

if [ "$1" == "setup" ]
then
	bspc config top_padding			48
	bspc config bottom_padding	20
	bspc config right_padding		200
	bspc config left_padding		200
elif [ $(bspc config bottom_padding) == "0" ]
then
	bspc config top_padding			48
	bspc config bottom_padding	20
	bspc config right_padding		200
	bspc config left_padding		200
else
	bspc config top_padding			28
	bspc config bottom_padding	0
	bspc config right_padding		0
	bspc config left_padding		0
fi

