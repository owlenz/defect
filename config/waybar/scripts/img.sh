#!/bin/bash

album_art=$(playerctl -p spotify metadata mpris:artUrl)
length=$(playerctl -p spotify metadata mpris:length)

if [[ -z $album_art ]] 
then
   exit
fi

output_file="/tmp/$length.jpeg"

if [[ ! -f "$output_file" ]]; then
    # Download the image only if it doesn't exist
    curl -s "$album_art" --output "$output_file"
fi

# Print the output file path
echo "$output_file"
