#!/bin/bash

RET=$(echo -e "Lock\nCaffeinate\nSuspend\nReboot\nShutdown" | dmenu -nf '#F8F8F2' -nb '#44475a' -sb '#ff5555' -sf '#F8F8F2' -fn 'Monaco-12' -p 'Exit?' )


case $RET in
	Shutdown) sudo poweroff ;;
	Reboot) sudo reboot ;;
	Lock) betterlockscreen -l ;;
	Suspend) systemctl suspend ;;
	Caffeinate) TIME=$(echo -e "30m\n1h\n1d\nCancel" | dmenu  -nf '#F8F8F2' -nb '#44475a' -sb '#ff79c6' -sf '#44475a' -fn 'Monaco-12' -p 'How long?' );; 
	*) ;;
esac

case $TIME in
	Cancel) ;;
	*) systemd-inhibit --what=handle-lid-switch sleep $TIME ;;
esac
