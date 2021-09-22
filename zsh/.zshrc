export ZSH="/usr/share/oh-my-zsh"
export npm_config_prefix="$HOME/.local"
export EDITOR=nvim

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.config/scripts:$PATH

alias k="kubectl"
alias v="nvim"
alias val="nvim ~/.config/alacritty/alacritty.yml"
alias vi3="nvim ~/.config/i3/config"
alias vnv="nvim ~/.config/nvim/init.vim"
alias vpi="nvim ~/.config/picom/picom.conf"
alias van="nvim ~/Projects/ansible-playbooks/"

plugins=(
  tmux
  fzf
  python
  command-not-found
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^ ' autosuggest-accept
eval "$(starship init zsh)"
