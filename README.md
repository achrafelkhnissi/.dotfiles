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
---       
- [ ] Make `oh-my-zsh` the default shell without using the interactive script.
