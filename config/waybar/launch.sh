#!/bin/bash

# start waybar if not started
if ! pgrep -x "waybar" >/dev/null; then
	sleep 1
	waybar > ~/waybar.log &
fi

# current checksums
current_checksum_config=$(md5sum ~/.config/waybar/config.jsonc)
current_checksum_style=$(md5sum ~/.config/waybar/style.css)

# loop forever
while true; do
	# new checksums
	new_checksum_config=$(md5sum ~/.config/waybar/config.jsonc)
	new_checksum_style=$(md5sum ~/.config/waybar/style.css)

	# if checksums are different
	if [ "$current_checksum_config" != "$new_checksum_config" ] || [ "$current_checksum_style" != "$new_checksum_style" ]; then
		# kill waybar
		pgrep waybar | xargs kill

		# start waybar
		waybar &

		# update checksums
		current_checksum_config=$new_checksum_config
		current_checksum_style=$new_checksum_style
	fi
    sleep 1
done
