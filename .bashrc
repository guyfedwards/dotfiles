# Nothing to see here — Everything's in .bash_profile

# Check ssh-agent running then add
eval `ssh-agent -s`
ssh-add

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source /Users/gedwards/sites/devtools/.source
ssh-add /Users/gedwards/.vagrant.d/insecure_private_key &>/dev/null
alias nginx='sudo env rvm_trust_rvmrcs_flag=1 /usr/local/bin/nginx'
alias stopnginx='sudo /usr/local/bin/nginx -s stop'

PERL_MB_OPT="--install_base \"/Users/gedwards/perl5\"";
export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/gedwards/perl5";
export PERL_MM_OPT;

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Go
export GOPATH=$HOME/sites/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
