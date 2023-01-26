#!/usr/bin/bash

bspc rule -a "notifications-less" state=floating rectangle=631x732+644+174
kitty --class notifications-less -e dunst-history &

