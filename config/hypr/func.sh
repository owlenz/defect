#!/bin/sh

while getopts "1234567" flag; do
	case $flag in
	1) # open spotify
		spotify
		;;
	2) # play/pause
		browserStatus=$(playerctl status -p firefox)
		if [[ $browserStatus == "Playing" ]]; then
			playerctl pause -p firefox
		else
			playerctl play-pause -p spotify
		fi
		;;
	3) # prev song
			playerctl previous -p spotify
		;;
	4) # next song
			playerctl next -p spotify
		;;
	5) # lower volume by 5%
		pactl set-sink-mute 0 false
		pactl set-sink-volume 0 -5%
		;;
	6) # raise volume by 5%
		pactl set-sink-mute 0 false
		pactl set-sink-volume 0 +5%
		;;
	7) # lower volume by 5%
		pactl set-sink-mute 0 toggle
		;;
	\?)
		echo "Usage: $(basename $0) [-5] [-6] [-7]"
		;;
	esac
done
