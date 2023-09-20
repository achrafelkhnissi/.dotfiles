# Setup fzf
# ---------
if [[ ! "$PATH" == */goinfre/ael-khni/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/goinfre/ael-khni/homebrew/opt/fzf/bin" # 42 iMac
fi
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin" # Personal MacBook Pro
fi

# Auto-completion
# ---------------
if [ -d "/Users/ael-khni/goinfre" ] ; then
  [[ $- == *i* ]] && source "/goinfre/ael-khni/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null
  else
  [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null
fi

# Key bindings
# ------------
if [ -d "/Users/ael-khni/goinfre" ] ; then
  source "/goinfre/ael-khni/homebrew/opt/fzf/shell/key-bindings.bash"
  else
  source "/usr/local/opt/fzf/shell/key-bindings.bash"
fi
