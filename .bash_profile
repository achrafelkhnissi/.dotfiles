
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
# for DOTFILE in `find $HOME/.dotfiles -maxdepth 1 -name '.*' -type f`;
for DOTFILE in `find $HOME/.dotfiles -name '.*' -type f`;
do
#     [ -f $HOME/$DOTFILE ] && source $HOME/$DOTFILE
    [ -f $HOME/$DOTFILE ] && echo $HOME/$DOTFILE
done

# Change it to be dynamic
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
