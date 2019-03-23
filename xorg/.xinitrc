#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap -layout us -option caps:escape
xrandr --output eDP1 --mode 1929x1080
exec i3
