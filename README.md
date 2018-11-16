Dotfiles
========

### To Install:
```
git clone git@github.com:guyfedwards/dotfiles ~/dotfiles
```

### Setup scripts
Many setup scripts are available in `setup/`, run them individually like so:
```
~/dotfiles/setup/dotfiles
```

##### Scripts
`bin` - install scripts to `/usr/local/bin`

`config` - symlink `~/.config`

`dotfiles` - backup old dotfiles and symlink all dotfiles specified

`fonts` - install required fonts (arch only)

`karabiner` - symlink karabiner settings (mac only)

`lockscreen` - install dependencies for lockscreen (arch only)

`neovim` - symlink neovim config and symlink `.vimrc` with `init.vim`

`packages` - install variety of packages (arch only)

`tmux` - installs tmux and then tpm


### Karabiner settings
This script will symlink the `.plist` and `private.xml` files for karabiner on OSX
```
./setup/karabiner
```
