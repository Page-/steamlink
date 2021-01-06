#!/bin/bash

STEAMLINK_SH=~/.local/share/SteamLink/steamlink.sh

while [ ! - "$STEAMLINK_SH" ]
do
	sleep 5
done

if grep -q 'read line' $STEAMLINK_SH; then
	# Disable waiting for input
	sed -i  's|read line||' $STEAMLINK_SH
	pkill -9 startx
fi
