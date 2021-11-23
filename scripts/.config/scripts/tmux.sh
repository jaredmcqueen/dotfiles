#!/bin/sh
if [[ ! $(tmux list-sessions) ]]; then 
  tmux new-session -s tmux
else
  tmux attach
fi
