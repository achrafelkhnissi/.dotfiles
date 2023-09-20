[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -d  ~/.vim/undodir ]] || mkdir -p ~/.vim/undodir

if [ -d "/Users/ael-khni/goinfre" ] ; then
    source /Users/ael-khni/.docker/init-bash.sh || true # Added by Docker Desktop
fi
