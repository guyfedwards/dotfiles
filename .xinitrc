[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
exec i3
