#!/bin/bash

# Check if system is macOS or Linux
SYSTEM=$(uname -s)
CMD=""
if [ "$SYSTEM" = "Darwin" ]; then
  CMD="brew"
elif [ "$SYSTEM" = "Linux" ]; then
  CMD="apt-get"
else
  echo "Unsupported system"
  exit 1
fi

# Add Homebrew to PATH
if [ "$SYSTEM" = "Darwin" ]; then
  PATH="/usr/local/bin:$PATH"
else
  PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

# check if curl is installed
if ! command -v curl >/dev/null 2>&1; then
  echo "Installing curl..."
  $CMD install curl
fi

# check if git is installed
if ! command -v git >/dev/null 2>&1; then
  echo "Installing git..."
  $CMD install git
fi

# Check if brew is installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # or
  # git clone https://github.com/Homebrew/brew homebrew
  # eval "$(homebrew/bin/brew shellenv)"
  # brew update --force --quiet
  # chmod -R go-w "$(brew --prefix)/share/zsh"

fi

# Install Homebrew packages
brew bundle --file="$TARGET/system/Brewfile"

# if ps is not installed
if ! command -v ps >/dev/null 2>&1; then
  echo "Installing ps..."
  $CMD install procps
fi

# Check if brew is in PATH
if ! command -v brew >/dev/null 2>&1; then
  # Add Homebrew to PATH
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.zprofile
fi

# Install build-essential if the system is linux
if ! command -v brew >/dev/null 2>&1 && [ "$SYSTEM" = "Linux" ]; then
  echo "Installing build-essential..."
  sudo apt-get install build-essential
fi

# Install gcc (recommended by brew) if not installed
if ! command -v gcc >/dev/null 2>&1; then
  echo "Installing gcc..."
  apt-get install gcc
fi
