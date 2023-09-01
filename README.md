# .dotfiles

## Installation
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/achrafelkhnissi/.dotfiles/main/install.sh)"
```

## References
- [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles/)
- [Aweome dotfiles](https://project-awesome.org/webpro/awesome-dotfiles)


## Notes
- Adding new plugin using submodule:
```bash
git submodule add https://github.com/djui/alias-tips
git submodule update --init
```

## Todo
- [x] Make `copilot.vim` work on a remote server.
- [ ] Automate installation of `.dotfiles` on a new machine.
- [x] Install `brew` without the need to press `Enter` key.
- [x] Install `oh-my-zsh` without the need to press `Y` key.
- [x] Make `oh-my-zsh` the default shell without using the interactive script.
- [ ] Automate the authentication of `copilot.vim` plugin.
- [ ] Add aliases and environment variables.
- [ ] Use `Brewfile` to install all the required packages and applications.
- [ ] Add `OSX` configuration.
- [ ] Add `SSH` configuration.
- [ ] Setup `SSH` keys on a new machine.

#### FZF
- [ ] Add `fzf` configuration.
- [ ] Add `fzf` key bindings.
- [ ] Add `fzf` key bindings for `vim`.
- [ ] Make `fzf` search content of files.

#### Vim
- [ ] Install the syntax checkers required by `syntastic` plugin.
- [ ] Fix `undodir` and `plugged` being tracked by `git`.
