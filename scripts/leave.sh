#!/bin/bash

RET=$(echo -e "Lock\nSuspend\nReboot\nShutdown" | dmenu -nf '#F8F8F2' -nb '#44475a' -sb '#ff5555' -sf '#F8F8F2' -fn 'Monaco-12' -p 'Exit?' )


case $RET in
	Shutdown) sudo poweroff ;;
	Reboot) sudo reboot ;;
	Lock) betterlockscreen -l ;;
	Suspend) systemctl suspend && betterlockscreen -l ;;
	*) ;;
esac