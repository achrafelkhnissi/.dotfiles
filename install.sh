#!/usr/bin/env bash

echo "Current directory: $(pwd)"

# ---- Colors ----
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
BOLD="\033[1m"
UNDERLINE="\033[4m"
RESET="\033[0m"


# ---- Variables ----
SOURCE="https://github.com/achrafelkhnissi/.dotfiles.git"
TARGET="$HOME/.dotfiles"
DOTFILES="$HOME/.dotfiles"
SYSTEM=$(uname -s)
CMD=""
BREW_PATH="$HOME/.brew"
BREW_BIN_PATH="$BREW_PATH/bin"

if [ "$SYSTEM" = "Darwin" ]; then
  CMD="brew"
elif [ "$SYSTEM" = "Linux" ]; then
  CMD="apt-get"
else
  printf "%sUnsupported system%s\n" "$RED" "$RESET"
  exit 1
fi

# ---- Functions ----

# Remove existing dotfiles
function remove_existing() {
  for file in "$DOTFILES"/.[^.]*; do
    to_be_removed="$HOME/$(basename "$file")"
    [[ -d "$to_be_removed" ]] && continue
    if [[ -e "$to_be_removed" ]]; then
      rm -rf "$to_be_removed"
      print "Removed $to_be_removed"
    fi
  done
}

# Check if a command exists
is_executable() {
  type "$1" > /dev/null 2>&1
}

print() {
  echo -e "$GREEN" "$1" "$RESET"
}

error() {
  echo -e "$RED" "$1" "$RESET"
  exit 1
}

# ---- Main ----

# Update package manager
print "Updating package manager..."
$CMD update -y
print "Done"

# Install brew dependencies [Git, Curl, Zsh]
if ! is_executable "git"; then
  print "Installing git..."
  $CMD install -y git
  print "Done"
fi



if ! is_executable "curl"; then
  print "Installing curl..."
  $CMD install -y curl
  print "Done"
fi

if ! is_executable "zsh"; then
  print "Installing zsh..."
  $CMD install -y zsh
  print "Done"
fi

# Install brew
if ! is_executable "brew"; then
  print "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    /bin/chown -R "$HOME":"$HOME" /home/linuxbrew/.linuxbrew/Homebrew
    $CMD install -y procps
    (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> "$HOME"/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    source "$HOME"/.profile
  print "Done"
fi

# Clone dotfiles
print "Cloning dotfiles..."
git clone --recurse-submodules "$SOURCE" "$TARGET"
print "Done"

# Install Homebrew
if [ "$SYSTEM" = "Darwin" ]; then
  # Change this with proper installation
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Install Homebrew packages
  # brew bundle --file="$TARGET/system/Brewfile"
  echo ;
fi

# Install oh-my-zsh
print "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
print "Done"

# Install stow for dotfiles
print "Installing stow..."
$CMD install -y stow
print "Done"

# Remove existing dotfiles
#print "Removing existing dotfiles..."
#remove_existing
#print "Done"

# Use stow to symlink dotfiles
pwd
print "Symlinking dotfiles..."
#stow --target="$HOME" --dir="$DOTFILES" . || exit 1
print "Done"

# Make zsh default shell
chsh -s "$(which zsh)"

print "DONE INSTALLING DOTFILES!"
