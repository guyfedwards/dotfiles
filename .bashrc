# Nothing to see here — Everything's in .bash_profile
[ -n "$PS1" ] && source ~/.bash_profile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

### Disable ctrl-s sending XOFF
stty ixany
stty ixoff -ixon
