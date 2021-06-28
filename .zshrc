export ZSH="/home/jared/.oh-my-zsh"

alias k="kubectl"

plugins=(
  fzf
  git
  git-extras
  python
  common-aliases
  command-not-found
  # zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-accept
eval "$(starship init zsh)"
