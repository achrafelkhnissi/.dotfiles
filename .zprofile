
# Added by Toolbox App
export PATH="$PATH:/Users/achrafelkhnissi/Library/Application Support/JetBrains/Toolbox/scripts"

# Install brew if it doesn't exist
function install_brew() {
    if ! command -v brew &> /dev/null
    then
        echo "brew could not be found"
        echo "Installing brew..."
        git clone https://github.com/Homebrew/brew /Users/ael-khni/goinfre/homebrew
        eval "$(/Users/ael-khni/goinfre/homebrew/bin/brew shellenv)"
        chmod -R go-w "$(brew --prefix)/share/zsh"
    fi
}

# Install fzf if it doesn't exist
function install_fzf() {
    if ! command -v fzf &> /dev/null
    then
        echo "fzf could not be found"
        echo "Installing fzf..."
        brew install fzf
        $(brew --prefix)/opt/fzf/install
    fi
}

# Added by Brew
if [ -d "/Users/ael-khni/goinfre" ] ; then
    eval "$(/Users/ael-khni/goinfre/homebrew/bin/brew shellenv)"
    install_brew
    install_fzf
else
    eval "$(/usr/local/bin/brew shellenv)"
fi
