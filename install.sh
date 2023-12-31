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
OPT=""
NODE=""

if [ "$SYSTEM" = "Darwin" ]; then
  CMD="brew"
  BREW_PATH="/usr/local/Homebrew/"
  NODE="node"
elif [ "$SYSTEM" = "Linux" ]; then
  CMD="apt-get"
  BREW_PATH="/home/linuxbrew/.linuxbrew/Homebrew"
  OPT="-y"
  NODE="nodejs"
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

install_ohmyzsh() {
  if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
  fi
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
}

install_stow() {
  $CMD install $OPT stow || exit 1
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
$CMD update $YES

# Install dependencies if Linux
if [ "$SYSTEM" = "Linux" ]; then
  info "apt-get -y install build-essential procps curl file git zsh"
  apt-get install -y build-essential procps curl file git zsh
  apt-get install -y python3
fi

# Install brew
if ! is_executable "brew" && [ "$SYSTEM" = "Darwin" ]; then
  # https://github.com/Homebrew/install
  info "Installing brew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  info "eval \"\$($BREW_PATH/bin/brew shellenv)\""
  eval "$("$BREW_PATH"/bin/brew shellenv)"
fi

# Clone dotfiles
info "git clone --recurse-submodules $SOURCE $TARGET"
if [ -d "$TARGET" ]; then
  info "rm -rf $TARGET"
  rm -rf "$TARGET"
fi
git clone --recurse-submodules "$SOURCE" "$TARGET"

# Install oh-my-zsh
info "Installing oh-my-zsh"
install_ohmyzsh

# Install stow for dotfiles
info "$CMD install -y stow"
if ! is_executable "stow"; then
  install_stow
fi

# Remove existing dotfiles
info "Remove existing dotfiles"
remove_existing

# Install dotfiles
info "stow --target=\"$HOME\" --dir=\"$DOTFILES\" ."
stow --target="$HOME" --dir="$DOTFILES" . || exit 1

# Make zsh default shell
info "chsh -s \"$(which zsh)\""
if [ "$SHELL" != "$(which zsh)" ]; then
  chsh -s "$(which zsh)"
fi

# ---- Install Vim ----
if ! is_executable "vim"; then
  info "Installing vim"
  $CMD install $OPT vim
fi

if ! is_executable "$NODE"; then
  info "Installing nodejs"
  $CMD install $OPT $NODE
fi

# Enable touchid for sudo if MacOS
if [ "$SYSTEM" = "Darwin" ]; then
  info "Enable touchid for sudo"
  #sudo sed -i '' 's/# %wheel\tALL=(ALL) ALL/%wheel\tALL=(ALL) ALL/g' /etc/sudoers
  # Add "auth       sufficient     pam_tid.so" to /etc/pam.d/sudo
fi

print "${BOLD}DONE INSTALLING DOTFILES!"
