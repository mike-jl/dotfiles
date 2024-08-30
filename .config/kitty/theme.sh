#!/bin/bash

mode="$1"

# echo $mode

if [[ "$mode" == "dark" ]]; then
    # echo a
    /opt/homebrew/bin/kitty +kitten themes --reload-in=all Catppuccin Kitty Mocha
else
    # echo b
    /opt/homebrew/bin/kitty +kitten themes --reload-in=all Catppuccin Kitty Latte
fi
