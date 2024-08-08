#!/bin/sh

while getopts "1234567" flag; do
	case $flag in
	1) # open spotify
		spotify-launcher
		;;
	2) # play/pause
		browserStatus=$(playerctl status -p brave)
		if [[ $browserStatus == "Playing" ]]; then
			playerctl pause -p brave
		else
			qdbus6 org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
		fi
		;;
	3) # prev song
		qdbus6 org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
		;;
	4) # next song
		qdbus6 org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
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
