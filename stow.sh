#!/bin/sh
pushd $HOME/.dotfiles/
for f in *; do
  if [ -d "$f" ]; then
    echo "stowing $f"
    stow -D $f 
    stow $f
  fi
done 
popd
