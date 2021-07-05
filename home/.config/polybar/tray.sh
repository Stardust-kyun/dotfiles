#!/bin/bash
tray=$(cat ~/.config/polybar/Cabin/config.ini | grep "tray-position = none")
if [[ $tray == "" ]]; then
	sed -i -e 's/tray-position = .*/tray-position = none/g' ~/.config/polybar/Cabin/config.ini
	sed -i -e 's/tray-position = .*/tray-position = none/g' ~/.config/polybar/NoelRed/config.ini
	sed -i -e 's/tray-position = .*/tray-position = none/g' ~/.config/polybar/Arch/config.ini
else
	sed -i -e 's/tray-position = .*/tray-position = right/g' ~/.config/polybar/Cabin/config.ini
	sed -i -e 's/tray-position = .*/tray-position = right/g' ~/.config/polybar/NoelRed/config.ini
	sed -i -e 's/tray-position = .*/tray-position = right/g' ~/.config/polybar/Arch/config.ini
fi
~/.config/polybar/launch.sh &
