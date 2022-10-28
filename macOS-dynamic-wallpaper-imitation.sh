#!/usr/bin/bash

# The command to run to set wallpaper, will be
# run as command + wallpaper file.
#
# Make sure there is a space if needed.
WALLPAPER_SET_COMMAND="feh --bg-fill"

# This will prefix the name of the wallpapers.
WALLPAPER_BASE_NAME="/usr/share/backgrounds/Big Sur "

# Suffix to the wallpaper name, should be the only
# part that changes from filename to filename.
EARLY_SUNRISE="3.png"
LATE_SUNRISE="4.png"
DAYTIME="1.png"
EARLY_AFTERNOON="5.png"
LATE_AFTERNOON="6.png"
SUNSET="7.png"
DUSK="8.png"
NIGHT="2.png"

while [ true ]; do
	TIME=$(date +%H)
	echo "Hour is $TIME"
	
	if (( 7 <= $TIME )) && (( $TIME < 9 )); then
		FILE="$WALLPAPER_BASE_NAME$EARLY_SUNRISE"
		$WALLPAPER_SET_COMMAND "$FILE"
		echo "Using $FILE"
	elif (( 9 <= $TIME )) && (( $TIME < 11 )); then
		FILE="$WALLPAPER_BASE_NAME$LATE_SUNRISE"
		$WALLPAPER_SET_COMMAND "$FILE"
		echo "Using $FILE"
	elif (( 11 <= $TIME )) && (( $TIME < 13 )); then
		FILE="$WALLPAPER_BASE_NAME$DAYTIME"
		$WALLPAPER_SET_COMMAND "$FILE"
		echo "Using $FILE"
	elif (( 13 <= $TIME )) && (( $TIME < 15 )); then
		FILE="$WALLPAPER_BASE_NAME$EARLY_AFTERNOON"
		$WALLPAPER_SET_COMMAND "$FILE"
		echo "Using $FILE"
	elif (( 15 <= $TIME )) && (( $TIME < 16 )); then
		FILE="$WALLPAPER_BASE_NAME$LATE_AFTERNOON"
		$WALLPAPER_SET_COMMAND "$FILE"
		echo "Using $FILE"
	elif (( 16 <= $TIME )) && (( $TIME < 17 )); then
		FILE="$WALLPAPER_BASE_NAME$SUNSET"
		$WALLPAPER_SET_COMMAND "$FILE"
		echo "Using $FILE"
	elif (( 17 <= $TIME )) && (( $TIME < 18 )); then
		FILE="$WALLPAPER_BASE_NAME$DUSK"
		$WALLPAPER_SET_COMMAND "$FILE"
		echo "Using $FILE"
	else
		FILE="$WALLPAPER_BASE_NAME$NIGHT"
		$WALLPAPER_SET_COMMAND "$FILE"
		echo "Using $FILE"
	fi

	# Sleep for one minute between iterations.
	sleep 60
done

