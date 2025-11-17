#!/bin/sh

addPackage () {
  package="$1"

  if pacman -Q "$package" &>/dev/null; then
      echo "$package is installed."
  else
      echo "$package is not installed."
      sudo pacman -S "$package"
  fi
}

addPackage mpd
addPackage rmpc

sudo mkdir -p /etc/samba

CREDENTIALS=/etc/samba/credentials

if [ -e "$CREDENTIALS" ]; then
  echo "Credentials file exists"
else
  sudo sh -c "echo 'username=fillinusername\\npassword=fillinpassword' >> '$CREDENTIALS'"
fi
