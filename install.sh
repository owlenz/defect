#!/usr/bin/bash

homeFiles=(git zsh tmux)

# for element in "${homeFiles[@]}"; do
# 	stow $element -v -t ~/
# done

configFiles=(xdg-desktop-portal gtk picom fuzzel nvim kitty hypr mako rofi waybar neofetch i3 polybar lf zellij zathura foot)
configDir="${HOME}/.config"

##
##echo "link all? (y,n)"
#read answer 
#if [[ $answer == "y" ]]; then
	#for element in "${configFiles[@]}"; do
	#	if [[ -d $dir ]]; then
	#		rm $dir
#		fi
#		dir="${configDir}/${element}"
#		ln -sv ./config/$element $dir
#	done
#fi
##

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
