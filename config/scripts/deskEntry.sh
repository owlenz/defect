#!/usr/bin/bash

Exec=""

for arg in "$@"; do
	Exec+="$arg "
done

echo "Enter File Name:"
read Name

touch ~/.local/share/applications/"$Name.desktop"

file="$HOME/.local/share/applications/$Name.desktop"

echo "[Desktop Entry]" > "$file"
echo "Name=$Name" >> "$file"
echo "Exec=$Exec" >> "$file"
echo "Icon=wine" >> "$file"
echo "Type=Application" >> "$file"
