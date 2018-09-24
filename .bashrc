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

[ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

# add yarn
export PATH="$HOME/.yarn/bin:$PATH"

# bash completion from brew install bash-completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# kubectl completion
hash kubectl && source <(kubectl completion bash)

# git completion
# `$_` takes last parameter of previous command
test -f ~/.git-completion.bash && . $_

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then source "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then source "$HOME/google-cloud-sdk/completion.bash.inc"; fi
