#!/bin/bash
SESSION_NAME=fc
BASE_PATH="$HOME/sites/fundingcircle"
APP_PATH="$HOME/sites/fundingcircle/funding_circle_app"
FE_PATH="$HOME/sites/fundingcircle/fca-frontend"

tmux new -s $SESSION_NAME -d

tmux send-keys -t $SESSION_NAME:1.1 "cd ~/sites/fundingcircle" C-m
tmux send-keys -t $SESSION_NAME:1.1 "pkill -KILL -f ruby && foreman start" C-m

cd $APP_PATH
tmux split-window -h -t $SESSION_NAME:1.1

cd $FE_PATH
tmux split-window -v -t $SESSION_NAME:1.1
tmux resize-pane -t $SESSION_NAME:1.3 -U 10

cd $APP_PATH
tmux new-window -t $SESSION_NAME -a -n vim-fca
tmux send-keys -t $SESSION_NAME:2.1 "vim" C-m

cd $FE_PATH
tmux new-window -t $SESSION_NAME -a -n vim-fca-frontend
tmux send-keys -t $SESSION_NAME:3.1 "vim" C-m

tmux select-window -t $SESSION_NAME:1
tmux attach-session -t $SESSION_NAME


