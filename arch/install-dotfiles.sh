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

current_dir="$(pwd)"
cd "$REPO_PATH"
git pull

stow() {
  source_path="$REPO_PATH/.config/$1"
  config_path="$CONFIG_DIR/$1"
  echo "backing up $config_path"
  if [ -L "$config_path" ]; then
    echo "Removing existing symlink"
    rm "$config_path"
  elif [ -d "$config_path" ]; then
    echo "Existing dir $config_path found"
    mv -i -v "$config_path" "$config_path.bak"
  fi

  echo "stowing $source_path in $config_path"
  ln -s -i -v "$source_path" "$config_path"
}

echo "stowing configs"

stow tmux
stow alacritty
stow mpd

# nvim already has a whole folder and installation
#stow nvim
NVIM_OVERRIDES="$REPO_PATH/.config/nvim/lua/plugins/overrides.lua"
if [ -L "$NVIM_OVERRIDES" ]; then
  echo "nvim already exists"
else
  ln -s -i -v "$NVIM_OVERRIDES" "$CONFIG_DIR/nvim/lua/plugins/overrides.lua"
fi

# Return to directory we were previously at
cd "$current_dir"
