#!/bin/sh

REPO_URL=git@github.com:judocode/filesofdot.git
REPO_PATH=~/.dotfiles
CONFIG_DIR=~/.config

echo "Cloning dotfiles repo: $REPO_URL"

if [ -d "$REPO_PATH" ]; then
  echo "Repository $REPO_PATH already exists";
else
  git clone "$REPO_URL" "$REPO_PATH"
fi

cd "$REPO_PATH"
git pull

stow() {
  source_path="$REPO_PATH/.config/$1"
  config_path="$CONFIG_DIR/$1"
  echo "stowing $source_path in $config_path"
  ln -s -i -v "$source_path" "$config_path"
}

echo "delete old configs"
mv -i -v ~/.config/nvim ~/.config/nvim.bak
mv -i -v ~/.config/tmux ~/.config/tmux.bak
# rm -rf ~/.config/nvim

echo "stowing configs"

stow tmux
stow nvim

