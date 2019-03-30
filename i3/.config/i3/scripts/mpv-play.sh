#!/bin/bash

LINK=`xsel -ob`
exec mpv "$LINK" && disown

notify-send "Playing $link"