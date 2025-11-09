#!/bin/sh

# Delete packages only if they already exist
sudo pacman -Rns $(pacman -Qq | grep -Fx -f <(printf "%s\n" 1password-beta 1password-cli docker docker-buildx docker-compose spotify obsidian)) 


