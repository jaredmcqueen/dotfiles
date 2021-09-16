export ZSH="/usr/share/oh-my-zsh"
export npm_config_prefix="$HOME/.local"
export EDITOR=nvim

export https_proxy=http://10.0.0.63:8118/
export http_proxy=http://10.0.0.63:8118/
export HTTP_PROXY=http://10.0.0.63:8118/
export HTTPS_PROXY=http://10.0.0.63:8118/

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOQUIT=false


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
  common-aliases
  command-not-found
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^ ' autosuggest-accept
eval "$(starship init zsh)"
