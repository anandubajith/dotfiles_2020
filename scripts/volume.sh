#!/bin/bash
msd_id=456
amount=5
icon=/usr/share/icons/Paper/32x32/apps/multimedia-volume-control.png

volume="$(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')%"

if [ "$1" = "inc" ]; then
    amixer -q sset 'Master' $amount%+
elif [ "$1" = "dec" ]; then
    amixer -q sset 'Master' $amount%-
else 
    if [ "$volume" = "0%" ]; then
        amixer -q sset 'Master' 50%
    else
        amixer -q sset 'Master' 0
    fi
fi

volume="$(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')%"
dunstify -r $msd_id  -t 1000 -u low "Volume" $volume -i $icon