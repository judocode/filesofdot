#!/bin/sh

echo "Removing chromium"
# Remove chromium and its conf files
sudo pacman -Rns chromium

echo "Installing zen browser"
# Install zen browser from aur
sudo yay -S zen-browser-bin


