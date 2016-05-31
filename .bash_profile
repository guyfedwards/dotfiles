# check if OSX
if [[ $OSTYPE == darwin* ]]; then
  export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
  # Use gnu tools instead
  export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# git completion
# `$_` takes last parameter of previous command
test -f ~/.git-completion.bash && . $_

# Shell only exists after the 10th consecutive Ctrl-d. Same as IGNOREEOF=10
set -o ignoreeof

### Aliases
# Nodeschool
alias funcjs='functional-javascript'

# simple server
alias server='python -m SimpleHTTPServer'

# VIM
alias v='nvim'

alias preview='open -a Preview'
alias chrome='open -a google\ chrome'
alias f='open -a Finder'
alias finder='open -a Finder'
alias ql='qlmanage -p' # quicklook
alias sqli='sequelize'
alias py='python'

# Shortcuts to folders
alias sites='cd ~/sites'
alias docs='cd ~/Documents'
alias dots='cd ~/dotfiles'
alias dotfiles='cd ~/dotfiles'
alias drop='cd ~/Dropbox'

# Editing dotfiles
alias bashp='vim ~/.bash_profile && source ~/.bash_profile'
alias vimrc='vim ~/.vimrc'

# Npm
alias nis='npm install --save'
alias nid='npm install --save-dev'

# Git
# Open current repo on github
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"
# hub === git
eval "$(hub alias -s)"

# Deprecated - Use git aliases instead
du="Do not use non git aliases for git"

alias gs='echo $du'
alias ga='echo $du'
alias gc='echo $du' # requires you to type a commit message
alias gp='echo $du'
alias gpu='echo $du'
alias gd='echo $du'
alias gdc='echo $du'
alias gb='echo $du'
alias gbd='echo $du'
alias gch='echo $du'
alias gchb='echo $du'
alias prune='echo $du'


# tmux aliases
alias tm='tmux'
alias tml='tmux ls'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tmn="tmux new-session \; \
  split-window -v -l 24 \; split-window -h -l 84 \; \
  select-pane -t 1 \; split-window -h -l 84 \; \
  select-pane -t 0 \; split-window -v -l 24 \; split-window -h -l 84 \; \
  select-pane -t 1 \; split-window -h -l 84 \; select-pane -t 0 \;"
alias tmfc='./tmux/session-scripts/tmux_fc.sh';


if [[ $OSTYPE == darwin* ]]; then
  # Show/Hide hidden files
  alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
  alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

  # Hide/show all desktop icons (useful when presenting)
  alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
  alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

  # Lock the screen (when going AFK)
  alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

  # Flush DNS caches
  alias flushdns='sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches;echo "flushed"'
fi

# General
alias yt='youtube-dl'

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  [ -z "$TMUX" ] && export TERM="xterm-256color"
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 9)
		ORANGE=$(tput setaf 172)
		GREEN=$(tput setaf 190)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
	else
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 5)
		ORANGE=$(tput setaf 4)
		GREEN=$(tput setaf 2)
		PURPLE=$(tput setaf 1)
		WHITE=$(tput setaf 7)
	fi
	BOLD=$(tput bold)
	RESET=$(tput sgr0)
else
	BLACK="\033[01;30m"
	MAGENTA="\033[1;31m"
	ORANGE="\033[1;33m"
	GREEN="\033[1;32m"
	PURPLE="\033[1;35m"
	WHITE="\033[1;37m"
	BOLD=""
	RESET="\033[m"
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="\[$ORANGE\]❯\[$RESET\] "


# show host if connected through ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    if [ "$color_prompt" = yes ]; then
        host="\u@\[\033[1;34m\]\h\[\033[00m\]"
    else
        host="\u@\h"
    fi
fi

prompt_user="\[${BOLD}${MAGENTA}\]\u$host"
prompt_cwd="\[$WHITE\]in \[$GREEN\]\w"
prompt_git="\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)"
prompt_symbol="\[$WHITE\]\n$symbol"

export PS1="$prompt_user $prompt_cwd\[$WHITE\]$prompt_git$prompt_symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


# Colored man pages
man() {
    env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}


### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# init z! (https://github.com/rupa/z)
. ~/z.sh

[ -n "$PS1" ] && source ~/.bashrc
