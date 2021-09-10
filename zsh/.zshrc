export ZSH="/usr/share/oh-my-zsh"
export EDITOR=nvim
export fontsize=20

alias k="kubectl"
alias v="nvim"
alias val="nvim ~/.config/alacritty/alacritty.yml"
alias vi3="nvim ~/.config/i3/config"
alias vnv="nvim ~/.config/nvim/init.vim"
alias vpi="nvim ~/.config/picom/picom.conf"
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
