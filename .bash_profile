if [ -f "$HOME/.bashrc" ]; then
  # shellcheck source=/dev/null
  source "$HOME/.bashrc"
fi

export EDITOR=nvim
export DELTA_PAGER=bat

if [ -f "$HOME/.bash_alias_local" ]; then
source "$HOME/.bash_alias_local"
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Shell only exits after the 10th consecutive Ctrl-d. Same as IGNOREEOF=10
set -o ignoreeof

# aliases
### Enable aliases to be sudo’ed
alias sudo='sudo '

alias v='nvim'
alias vim='nvim'
alias yt='youtube-dl'
alias g='googler --count 5'
alias cin='asciinema rec -c "/bin/bash -l"'
alias preview='open -a Preview'
alias chrome='open -a google\ chrome'
alias f='open -a Finder'
alias u='units'

alias makoclear='makoctl dismiss -a'

alias chrome='google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland'

alias mountdev='udisksctl mount -b /dev/sda1'
alias unmountdev='udisksctl unmount -b /dev/sda1'

### color `ls`
colorflag="-G"
alias ls="command ls ${colorflag}"
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format

### simple server
alias server='python -m SimpleHTTPServer'

alias lock='swaylock --daemonize & systemctl suspend'

### Notes
function notes() {
  # echo $1
  (cd "$HOME/Dropbox/Documents/Notes/$1" && v -c "NERDTree")
}
alias todo='v -c "Goyo" ~/Dropbox/Documents/Notes/medicspot/todo.md'

### Edit dotfiles
alias bashp='v ~/.bash_profile && source ~/.bash_profile'
alias vimrc='v ~/.vimrc'
alias i3c='v ~/.config/i3/config'

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

## git
alias stpst="git stash && git pull && git stash pop"
alias yoda="git checkout master && git pull origin master"

# tmux
alias tm='tmux'
alias tml='tmux ls'
alias tma='tmux attach -t'
alias tmk='tmux kill-session -t'

function refenv() {
  if [ -n "$TMUX" ]; then
    export $(tmux show-environment | grep "^SSH_AUTH_SOCK")
    export $(tmux show-environment | grep "^SSH_CONNECTION")
    export $(tmux show-environment | grep "^SWAYSOCK")
    export $(tmux show-environment | grep "^DISPLAY")
  fi
}

# docker
alias allimgids='docker images | grep -v REPOSITORY | awk '\''{print $3}'\'''
alias allcontids="docker ps | grep -v CONTAINER | awk '\''{print $1}'\''"
alias denv='eval $(minikube docker-env)'
alias dc='docker-compose'
dclean(){
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
    docker image prune -a --filter "until=$(date +'%Y-%m-%dT%H:%M:%S' --date='-15 days')" 2>/dev/null
}

alias deno='docker run --network host -v $(pwd):/app -w /app denoland/deno:1.22.3'

function dnode() {
  args=$*
  exists=$(docker ps | grep -v CONTAINER | awk '{print $NF}' | grep node)

  if [[ $exists == "" ]]; then
    bash -c "docker run --rm --network host --name node -w /app -v $(pwd):/app node:22-slim $args"
  else
    bash -c "docker exec node $args"
  fi
}

alias k="kubectl"
function kx() {
  if [ -z $1 ]; then
    kubectl config current-context
  else
    kubectl config use-context $1
  fi
}

# eslintd
alias killeslint="ps aux | grep eslint_d | grep -v grep | awk '{print $2}' | xargs kill -9"

# Prompt Colors
### Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

function ccm() {
  echo "build
ci
chore
docs
feat
fix
perf
refactor
revert
style
test"
}

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
	[[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]] && echo "*"
}
function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

function get_k8s_context() {
  ctx=$(kubectl config current-context 2> /dev/null)

  if [[ "$ctx" = error* || "$ctx" = "" ]]; then
    true
  elif [[ $ctx = prod* ]]; then
    echo "$RED$ctx"
  else
    echo "$GRAY$ctx"
  fi
}

### Change this symbol to something sweet.
### (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="\[$GRAY\]└ \[$ORANGE\]> \[$RESET\]"
# symbol="\[$GRAY\]└ \[$ORANGE\]☠️ \[$RESET\] "

prompt_user="\[${BOLD}${LIGHTGRAY}\]\u$host"
prompt_cwd="\[${GRAY}\]\[$LIGHTGRAY\]\w"
prompt_k8s="\$(get_k8s_context)"
prompt_git="\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[${BLUE}\]\$(parse_git_branch)\[$WHITE\] at $prompt_k8s"
prompt_symbol="\n$symbol"

export PS1="\[$GRAY\]┌ $prompt_cwd\[$WHITE\]$prompt_git$prompt_symbol\[$RESET\]"
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
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -S --line-number --ignore --glob "!.git/*"'

## init z! (https://github.com/rupa/z)
. $HOME/z.sh

