#!/bin/sh

sudo pacman -S mpd rmpc
sudo mkdir -p /etc/samba
sudo sh -c 'echo "username=justus\\npassword=" >> /etc/samba/credentials'
