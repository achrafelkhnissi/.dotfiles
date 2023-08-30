#!/usr/bin/env bash

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
BREW_PATH=""

if [ "$SYSTEM" = "Darwin" ]; then
  CMD="brew"
  BREW_PATH="/usr/local/Homebrew/"
elif [ "$SYSTEM" = "Linux" ]; then
  CMD="apt-get"
  BREW_PATH="/home/linuxbrew/.linuxbrew/Homebrew"
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

info () {
  echo -e "$BLUE""==>" "$RESET" "$BOLD" "$1" "$RESET"
}

# ---- Main ----

# Update package manager
info "$CMD update -y"
$CMD update -y

# Install dependencies if Linux
if [ "$SYSTEM" = "Linux" ]; then
  info "apt-get install build-essential procps curl file git zsh"
  apt-get install -y build-essential procps curl file git zsh
  apt-get install -y python3 # dependency for alias_tips
fi

# Install brew
if ! is_executable "brew"; then
  # https://github.com/Homebrew/install
  info "Installing brew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  info "eval \"\$($BREW_PATH/bin/brew shellenv)\""
  eval "$("$BREW_PATH"/bin/brew shellenv)"
fi

# Clone dotfiles
info "git clone --recurse-submodules $SOURCE $TARGET"
git clone --recurse-submodules "$SOURCE" "$TARGET"

# Install oh-my-zsh
info "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Install stow for dotfiles
info "$CMD install -y stow"
$CMD install -y stow

# Remove existing dotfiles
info "Remove existing dotfiles"
remove_existing

# Install dotfiles
info "stow --target=\"$HOME\" --dir=\"$DOTFILES\" ."
stow --target="$HOME" --dir="$DOTFILES" . || exit 1

# Make zsh default shell
info "chsh -s \"$(which zsh)\""
chsh -s "$(which zsh)"

print "${BOLD}DONE INSTALLING DOTFILES!"
