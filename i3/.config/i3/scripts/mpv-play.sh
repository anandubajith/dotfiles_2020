#!/bin/bash
echo "hi"
LINK=$(echo -e ''  | dmenu -p 'Enter MRL: ')

notify-send $LINK