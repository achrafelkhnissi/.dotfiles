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

# Check if brew is installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Homebrew packages
brew bundle --file="$TARGET/system/Brewfile"

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
