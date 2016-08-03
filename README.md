Dotfiles
========

To Install:
```
cd ~
git clone git@github.com:guyfedwards/dotfiles.git
sh ~/dotfiles/install.sh
```

The install script will backup existing files and symlink the new ones from the `~/dotfiles` directory.

Install fonts/* for powerline symbols support

###Karabiner settings
This script will symlink the `.plist` and `private.xml` files for karabiner on OSX
```
./karabinersetup
```
