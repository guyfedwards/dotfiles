# Nothing to see here — Everything's in .bash_profile
[ -n "$PS1" ] && source ~/.bash_profile

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### AWS Java setup
export JAVA_HOME=$(/usr/libexec/java_home)

### Disable ctrl-s sending XOFF
stty ixany
stty ixoff -ixon
