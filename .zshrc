# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# ZSH_THEME="robbyrussell"
#ZSH_THEME="kardan"
ZSH_THEME="minimal" #"mh"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Colorls
#if [ -x "$(command -v colorls)" ]; then
#    alias ls="colorls"
#    alias la="colorls -al"
#fi

# Logo-ls
#if [ -x "$(command -v logo-ls)" ]; then
#    alias ls='logo-ls'
#    alias la='logo-ls -A'
#    alias ll='logo-ls -al'
    # equivalents with Git Status on by Default
#    alias lsg='logo-ls -D'
#    alias lag='logo-ls -AD'
#    alias llg='logo-ls -alD'
#fi

# For coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

if [ -d "/Users/ael-khni/goinfre" ] ; then
  source /Users/ael-khni/.docker/init-zsh.sh || true # Added by Docker Desktop
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/goinfre/ael-khni/homebrew/opt/nvm/nvm.sh" ] && \. "/goinfre/ael-khni/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/goinfre/ael-khni/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/goinfre/ael-khni/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


export PATH="${HOME}/bin:$PATH"

