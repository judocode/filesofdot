#!/bin/sh

# TODO: Should chromium be removed?
# echo "Removing chromium"
# Remove chromium and its conf files
# sudo pacman -Rns chromium

# Install zen browser from aur
echo "Installing zen browser"

package="zen-browser-bin"

if yay -Q "$package" &>/dev/null; then
    echo "$package is installed."
else
    echo "$package is not installed."
    yay -S zen-browser-bin
fi


