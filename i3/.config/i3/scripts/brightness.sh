#!/bin/sh
amount=5
id=455
icon=/usr/share/icons/Paper/32x32/apps/preferences-system-brightness-lock.png

if [ "$1" = "inc" ]; then
    xbacklight -inc $amount
    light=$(xbacklight | cut -c1-2)
    dunstify -r $id -u low -t 1000 Brightness "$light%" -i $icon
elif [ "$1" = "dec" ]; then
    xbacklight -dec $amount
    light=$(xbacklight | cut -c1-2)
    dunstify -r $id -u low -t 1000 Brightness "$light%" -i $icon
fi
