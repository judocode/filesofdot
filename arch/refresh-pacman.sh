#!/bin/sh

echo "Removing orphaned packages from pacman"

#  Remove orphaned packages
# TODO: this might remove too much
# sudo pacman -Rns $(pacman -Qtdq)

echo "Updating pacman cache"
# Reset cache
# sudo pacman -Sc

