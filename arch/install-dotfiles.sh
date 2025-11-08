#!/bin/sh

REPO_URL=https://github.com/judocode/filesofdot.git
REPO_PATH=~/.dotfiles

if [ -d "$REPO_PATH" ]; then
  echo "Repository $REPO_PATH already exists";
else
  git clone "$REPO_URL" "$REPO_PATH"
fi

cd "$REPO_PATH"
git pull

stow() {
  ln -s "$REPO_PATH/.config/$1" "~/.config/$1"
}

echo "delete old configs"
# rm -rf ~/.config/nvim

# ln -s "$REPO_PATH/.config/tmux" ~/.config/tmux
# ln -s "$REPO_PATH/.config/nvim" ~/.config/nvim
stow tmux
stow nvim

