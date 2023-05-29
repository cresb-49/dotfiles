#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CARD="$(light -L | grep 'backlight' | head -n1 | cut -d'/' -f3)"
INTERFACE="$(ip link | awk '/state UP/ {print $2}' | tr -d :)"
RFILE="$DIR/.module"

# Fix backlight and network modules
fix_modules() {
	if [[ -z "$CARD" ]]; then
		sed -i -e 's/backlight/bna/g' "$DIR"/config.ini
	elif [[ "$CARD" != *"intel_"* ]]; then
		sed -i -e 's/backlight/brightness/g' "$DIR"/config.ini
	fi

	if [[ "$INTERFACE" == e* ]]; then
		sed -i -e 's/network/ethernet/g' "$DIR"/config.ini
	fi
}

# Launch the bar
launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
	#Intruccion para visualizar los monitores -> polybar --list-monitors | cut -d":" -f1
	#Declaracion de los monitores existentes
	mon1=DP-1 #DELL
	mon2=HDMI-0 #AZUs
	mon3=HDMI-1 #SAMSUMG
	#Ejecucion con la variable de entorno MONITOR
	MONITOR=$mon2 polybar -q main -c "$DIR"/config.ini &
	MONITOR=$mon1 polybar -q left -c "$DIR"/config.ini &
	MONITOR=$mon3 polybar -q rigth -c "$DIR"/config.ini &
}

# Execute functions
if [[ ! -f "$RFILE" ]]; then
	fix_modules
	touch "$RFILE"
fi	
launch_bar
