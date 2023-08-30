#!/bin/bash

# Check if system is macOS or Linux
SYSTEM=$(uname -s)
CMD=""
if [ "$SYSTEM" = "Darwin" ]; then
  CMD="brew"
elif [ "$SYSTEM" = "Linux" ]; then
  CMD="sudo apt-get"
else
  echo "Unsupported system"
  exit 1
fi

# Update
$CMD update
if [ "$SYSTEM" = "Darwin" ]; then
  $CMD upgrade
fi

# Check vim version
VIM_VERSION=$(vim --version | head -n 1 | awk '{print $5}')

# Check if brew is installed
if ! command -v brew >/dev/null 2>&1; then
  if [ $(echo "$VIM_VERSION < 9.0" | bc -l) -eq 1 ]; then
    $CMD install vim
  fi
  exit $?
fi

# If vim version is less than if less than 9.0, install vim
if [ $(echo "$VIM_VERSION < 9.0" | bc -l) -eq 1 ]; then
  echo "Installing vim..."
  git clone git clone https://github.com/vim/vim.git ~/vim
  cd ~/vim || echo "Error: vim directory not found" && exit 1
  cd src || echo "Error: vim/src directory not found" && exit 1
  make && make install || "Error: vim installation failed" && exit 1
  cd "$HOME" && rm -rf ~/vim
fi
