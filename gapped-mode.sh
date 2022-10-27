#!/usr/bin/bash

if [ "$1" == "setup" ]
then
	bspc config window_gap 26
elif [ $(bspc config window_gap) == "0" ]
then
	bspc config window_gap 26
else
	bspc config window_gap 0 
fi

