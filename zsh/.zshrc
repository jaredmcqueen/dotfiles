export ZSH="/usr/share/oh-my-zsh"
export EDITOR=nvim
export TERM=xterm

alias k="kubectl"
alias v="nvim"
alias val="nvim ~/.config/alacritty/alacritty.conf"
alias vnv="nvim ~/.config/nvim/init.vim"
alias van="nvim ~/Projects/ansible-playbooks/"

plugins=(
  fzf
  python
  common-aliases
  command-not-found
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^ ' autosuggest-accept
eval "$(starship init zsh)"
