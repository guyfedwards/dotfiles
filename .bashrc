# Nothing to see here — Everything's in .bash_profile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

### Disable ctrl-s sending XOFF
stty ixany
stty ixoff -ixon

# add npm
PATH="$NPM_PACKAGES/bin:$PATH"
# add rubygems
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem
# add Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# add yarn
export PATH="$HOME/.yarn/bin:$PATH"
