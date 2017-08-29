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

# Shell only exits after the 10th consecutive Ctrl-d. Same as IGNOREEOF=10
set -o ignoreeof

# aliases
### Enable aliases to be sudo’ed
alias sudo='sudo '

alias v='nvim'
alias yt='youtube-dl'
alias g='googler --count 5'
alias cin='asciinema rec'
alias preview='open -a Preview'
alias chrome='open -a google\ chrome'
alias f='open -a Finder'

### color `ls`
colorflag="-G"
alias ls="command ls ${colorflag}"
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format

### simple server
alias server='python -m SimpleHTTPServer'

### Shortcuts to folders
alias sites='cd ~/sites'
alias dots='cd ~/dotfiles'
alias drop='cd ~/Dropbox'
alias notes='cd ~/Dropbox/Documents/Notes && v -c "Goyo"'
alias ideas='cd ~/Dropbox/Documents/Notes/ideas && v -c "Goyo" ideas.md'

alias bashp='v ~/.bash_profile && source ~/.bash_profile'
alias vimrc='v ~/.vimrc'
alias i3c='v ~/.config/i3/config'

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

### npm
alias nis='npm install --save'
alias nid='npm install --save-dev'

## git
alias stpst="git stash && git pull && git stash pop"
alias yoda="git checkout master && git pull origin master"
### Open current repo on github
alias gh="open \`git remote -v | grep git@github.com | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/:/\//' -e 's/git@/http:\/\//'\`"
### Open current repo on stash
stash() {
  remote=`git remote -v | grep 'stash.algomi.net' | grep fetch | head -1 | awk '{print $2}' | cut -d@ -f2`
  url=`echo "$remote" | cut -d\/ -f1`
  project=`echo "$remote" | cut -d\/ -f2`
  repo=`echo "$remote" | cut -d\/ -f3 | cut -d. -f1`
  open "https://$url/projects/$project/repos/$repo"
}
### hub === git
eval "$(hub alias -s)"

# tmux
alias tm='tmux'
alias tml='tmux ls'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'
alias tmn="tmux new-session \; \
  split-window -v -l 24 \; split-window -h -l 84 \; \
  select-pane -t 1 \; split-window -h -l 84 \; \
  select-pane -t 0 \; split-window -v -l 24 \; split-window -h -l 84 \; \
  select-pane -t 1 \; split-window -h -l 84 \; select-pane -t 0 \;"

### algomi
alias bs="(cd ~/sites/SYN2F/synchronicity-client && bkr run 'git status && pwd')"
function br() {
  (cd ~/sites/SYN2F/synchronicity-client && bkr run $@)
}

### docker
alias allimgids='docker images | grep -v REPOSITORY | awk '\''{print $3}'\'''
alias allcontids='docker ps | grep -v CONTAINER | awk '\''{print $1}'\'''

if [[ $OSTYPE == darwin* ]]; then
  # Show/Hide hidden files
  alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
  alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

  # Lock the screen (when going AFK)
  alias afk='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'
fi

# Prompt Colors
### Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  [ -z "$TMUX" ] && export TERM="xterm-256color"
fi

if tput setaf 1 &> /dev/null; then
	tput sgr0
	if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
		BLACK=$(tput setaf 190)
		MAGENTA=$(tput setaf 167)
		ORANGE=$(tput setaf 209)
		GREEN=$(tput setaf 83)
		PURPLE=$(tput setaf 141)
		WHITE=$(tput setaf 0)
        CREAM=$(tput setaf 230)
        GRAY=$(tput setaf 240)
        LIGHTGRAY=$(tput setaf 244)
        BLUE=$(tput setaf 75)
        RED=$(tput setaf 203)
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
export CREAM
export GRAY
export LIGHTGRAY
export BLUE
export RED

# Git branch details
function set_git_color() {
    git_status="$(git status 2> /dev/null)"

    if [[ ${git_status} =~ "working directory clean" ]]; then
        state="${GREEN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        state="${YELLOW}"
    else
        state="${LIGHT_RED}"
    fi
}
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

### Change this symbol to something sweet.
### (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="\[$GRAY\]└ \[$ORANGE\]❯\[$RESET\] "

prompt_user="\[${BOLD}${LIGHTGRAY}\]\u$host"
prompt_cwd="\[${GRAY}\]\[$LIGHTGRAY\]\w"
prompt_git="\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[${BLUE}\]\$(parse_git_branch)"
prompt_symbol="\n$symbol"

export PS1="\[$GRAY\]┌ $prompt_user $prompt_cwd\[$WHITE\]$prompt_git$prompt_symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"


### Colored man pages
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


# Misc
##fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

## Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

## init z! (https://github.com/rupa/z)
. ~/z.sh

source ~/.bashrc
