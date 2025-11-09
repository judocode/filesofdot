#!/bin/sh

set -e

# Assuming that hypr is already installed
HYPR_CONFIG=~/.config/hypr/hyprland.conf
SOURCE_TXT="source = ~/.dotfiles/.config/hypr/hyprland.conf"

echo "Updating hyprland"
if grep -q "$SOURCE_TXT" "$HYPR_CONFIG"; then
  echo "hyprland.config already sourced"
else
  echo "$SOURCE_TXT" >> "$HYPR_CONFIG"
  echo "hyprland.config updated"
fi

