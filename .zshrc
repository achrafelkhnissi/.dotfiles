# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# ZSH_THEME="robbyrussell"
#ZSH_THEME="kardan"
ZSH_THEME="minimal" #"mh"
ZSH_THEME="random"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git
  git-extras
  zsh-autosuggestions
  brew
  docker
  docker-compose
  gh
  gnu-utils
  macos
  node
  npm
  themes
  zsh-syntax-highlighting
  alias-tips
  #zsh-apple-touchbar
  vagrant
)

# For docker
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

source $ZSH/oh-my-zsh.sh

# ----  User configuration  ---- #

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR="vim"

# Compilation flags

# aliases

# This path is where brew installs binaries
export PATH="/usr/local/bin:$PATH"

# Fzf settings
# --> https://github.com/junegunn/fzf/discussions/2528
# --> https://github.com/junegunn/fzf
# --> https://github.com/junegunn/fzf/wiki/examples
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview-window=right:60% --preview "bat --color=always --style=header,grid --line-range :500 {}"'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Undodir files for vim
[[ -d  ~/.vim/undodir ]] || mkdir -p ~/.vim/undodir
