#!/usr/bin/env bash

# Check if system is macOS or Linux
SYSTEM=$(uname -s)
CMD=""

if [ "$SYSTEM" = "Darwin" ]; then
  CMD="brew install"
elif [ "$SYSTEM" = "Linux" ]; then
  CMD="sudo apt-get install"
else
  echo "Unsupported system"
  exit 1
fi

# Update App Store apps
#sudo softwareupdate -i -a

# Update Homebrew (Cask) & packages
#brew update
#brew upgrade

# Update npm & packages
#npm install npm -g
#npm update -g

SOURCE="https://github.com/achrafelkhnissi/.dotfiles.git"
TARGET="$HOME/.dotfiles"

is_executable() {
  type "$1" > /dev/null 2>&1
}

if is_executable "git"; then
  CMD="git clone $SOURCE $TARGET"
fi

if [ -z "$CMD" ]; then
  echo "Git not available. Aborting."
else
  echo "Installing dotfiles..."
  mkdir -p "$TARGET"
  eval "$CMD"
fi

cd "$TARGET" || exit 1
git submodule update --init --recursive # install submodules

# Install Homebrew
if [ "$SYSTEM" = "Darwin" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Install Homebrew packages
  brew bundle --file="$TARGET/system/Brewfile"
  exit 0
else 
    sudo apt-get update
    $CMD zsh
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install stow for dotfiles
$CMD stow

# Use stow to symlink dotfiles
stow --dir="$TARGET" --target="$HOME" --restow zsh
