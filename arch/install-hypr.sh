#!/bin/sh

set -e

# Assuming that hypr is already installed
HYPR_CONFIG=~/.config/hypr/hyprland.conf

echo "source = ~/.dotfiles/.config/hypr/hyprland.conf" >> "$HYPR_CONFIG"

