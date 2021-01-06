#!/bin/bash

rm /tmp/.X0-lock &>/dev/null || true

mkdir -p ~/.local/share/SteamLink/
touch ~/.local/share/SteamLink/.ignore_cpuinfo

export DISPLAY=:0
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
echo "Starting X in 2 seconds"
sleep 2

./disable-read-line.sh &

startx
# run a second time in case we removed user input and killed startx
startx

if [[ "${DEBUG}" == '1' ]]; then
	while :
	do
		echo "startx failed, so we will just wait here while you debug!"
		sleep 30
	done
fi
