#!/usr/bin/env bash

# homeFiles=(git zsh tmux)

# for element in "${homeFiles[@]}"; do
# 	stow $element -v -t ~/
# done

# configFiles=($(find ./config -maxdepth 1 -type d ! -name "*.bak" ! -wholename "./config" | awk '{gsub(/.\/config\//, ""); print}'))
# configDir="${HOME}/.config"

# for element in "${configFiles[@]}"; do
#     dir="${configDir}/${element}"
#     echo "Do you want to stow ${element}? (y/n)"
#     read answer
#     if [[ $answer == "y" ]]; then
#         if [[ -d $dir ]]; then
#             echo "Folder ${element} exists. Delete it? (y/n)"
#             read answer
#             if [[ $answer == "y" ]]; then
#                 rm -rf "$dir"
#             else
#                 mv "$dir" "${dir}.bak"
#             fi
#         fi
#         echo $dir
#         echo $element
#         mkdir -p "$dir"
#         stow "$element" -v -t "$dir" -d ./config
#     fi
# done


for arg in "$@"; do
    case $arg in
        -u)
            stow -D config -t ~/.config
            shift
            ;;
        -i)
            stow -R config -t ~/.config
            shift
            ;;
        *)
            echo "Unknown argument: $arg"
            ;;
    esac
done

echo "done"
