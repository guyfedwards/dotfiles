[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -f ~/.xbindkeysrc ]] && xbindkeys -p
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3
