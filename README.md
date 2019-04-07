# Dotfiles

![Screenshot](./screenshot.png?raw=true)

### Install
```
$ git clone git@github.com:guyfedwards/dotfiles $HOME/dotfiles
```

Many setup scripts are available in `setup/`, run them individually like so:
```
$ $HOME/dotfiles/setup/dotfiles
```

`bin` - install scripts to `/usr/local/bin`

`config` - symlink `~/.config`

`dotfiles` - backup old dotfiles and symlink all dotfiles specified

`fonts` - install required fonts (arch only)

`lockscreen` - install dependencies for lockscreen (arch only)

`neovim` - symlink neovim config and symlink `.vimrc` with `init.vim`

`packages` - install variety of packages (arch only)

`tmux` - installs tmux and then tpm
