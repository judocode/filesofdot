#!/bin/sh

echo "Installing tmux"
package="tmux"
if pacman -Q "$package" &>/dev/null; then
    echo "$package is installed."
else
    echo "$package is not installed."
    sudo pacman -S tmux
fi

echo "Installing tpm"
TPM_DIR="~/.config/tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
  echo "tpm already installed"
else
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
  # type this in terminal if tmux is already running
  tmux source ~/.config/tmux/tmux.conf
fi

# TODO: there isn't a great way to do this
# echo "Installing omarchy tmux themes"
