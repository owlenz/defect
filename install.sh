#!/usr/bin/bash

xdd=()

# shopt -s dotglob
for dir in */; do
	dir="${dir%/}"
	xdd+=("$dir")
done

homeFiles=(git zsh tmux)

for element in "${homeFiles[@]}"; do
	stow $element -v -t ~/
done

configFiles=(picom fuzzel nvim kitty hypr mako rofi waybar neofetch i3 polybar)
configDir="${HOME}/.config"

for element in "${configFiles[@]}"; do
	dir="${configDir}/${element}"
	echo "Do you want to stow ${element}? (y/n)"
	read answer
	if [[ $answer == "y" ]]; then
		if [[ -d $dir ]]; then
			echo "Folder ${element} exists. Delete it? (y/n)"
			read answer
			if [[ $answer == "y" ]]; then
				rm -rf "$dir"
			else
				mv "$dir" "${dir}.bak"
			fi
		fi
		mkdir -p "$dir"
		stow "$element" -v -t "$dir"
	fi
done

echo "done"
